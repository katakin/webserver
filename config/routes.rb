Webserver::Application.routes.draw do
  resources :ykt_sessions
  resources :events
  resources :companies

  resources :horoscopes
  resources :ykt_news
  resources :forecasts
  resources :forecast_todays
  resources :weathers

  # authenticated :user do
  #   root :to => 'home#index'
  # end
  root :to => "home#index"
  devise_for :users
  resources :users
end