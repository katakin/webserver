Webserver::Application.routes.draw do
  resources :ykt_news


  resources :forecasts


  resources :forecast_todays


  resources :prognozs


  resources :weathers


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end