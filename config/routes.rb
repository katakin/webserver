Webserver::Application.routes.draw do
  resources :horoscopes


  resources :weathers


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end