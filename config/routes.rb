LaunchSoon::Application.routes.draw do
  
  resources :reports

  resources :clientships

  resources :receipts
  
  resources :emails

  devise_for :users 
  
  root :to => 'emails#new'
 
  
end
