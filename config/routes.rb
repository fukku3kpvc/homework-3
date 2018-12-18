Rails.application.routes.draw do
  get "/rusrails", to: redirect("http://rusrails.ru")

  get "site/poem", to: "site#poem"

  get "planets/logo", to: "planets#logo"

  get "planets/about", to: "planets#about"

  root "planets#logo"

  resources :planets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
