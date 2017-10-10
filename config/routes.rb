
Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles do
  	resources :comments
  end
  resources :users
  
  root 'welcome#index'
end