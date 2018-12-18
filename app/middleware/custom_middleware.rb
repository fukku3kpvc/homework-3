class CustomMiddleware
  def initialize(app, format_chars = '-')
    @app = app
    @format_chars = format_chars
  end

  def frequency(words_arr)
    words_arr.inject(Hash.new(0)) do |result, word|
      result.update({ word => 1 }) { |key, old_value, new_value| old_value + new_value }
    end
  end

  def call env
    words = []
    status, headers, body = @app.call(env)
    Rails.logger.debug @format_chars * 20
    body.each do |msg|
      ActionController::Base.helpers.strip_tags(msg)
      msg.gsub!(/[^\p{L}\s\d]/, '')
      msg = msg.downcase
      words += msg.split(' ')
    end
    headers['X-Frequency'] = frequency(words).max_by { |k, v| v }
    Rails.logger.debug "X-Frequency: #{headers['X-Frequency']}"
    Rails.logger.debug @format_chars * 20
    [status, headers, body]
  end
end