class SiteController < ApplicationController
  def rusrails
    redirect_to "http://rusrails.ru"
  end

  def poem
    render plain:
"Я верю, друзья,\n
Караваны ракет\n
Помчат нас вперёд\n
От звезды до\n
звезды.\n
На пыльных\n
тропинках\n
Далёких планет\n
Останутся\n
Наши следы."
  end
end
