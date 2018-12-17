Rails.application.routes.draw do
  get "/rusrails" => "site_controller#rusrails"

  get "site/poem" => "site_controller#poem"

  get "planets/logo" => "planets#logo"

  get "planets/about" => "planets#about"

  root "planets#logo"

  resources :planets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
