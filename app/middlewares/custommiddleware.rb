class CustomMiddleware
  def initialize(app, format_chars = '-')
    @app = app
    @format_chars = format_chars
  end

  def call env
    start_time = Time.now
    status, headers, body = @app.call(env)
    headers['X-Duration'] = Time.now - start_time
    Rails.logger.debug @format_chars * 20
    Rails.logger.debug "duration time #{headers['X-Duration']}"
    Rails.logger.debug @format_chars * 20
    [status, headers, body]
  end
end