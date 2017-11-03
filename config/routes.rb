Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :emojis
  resources :articles do
  	resources :comments
  end

  get 'process_like', to: 'articles#process_like', as: :reacting

  root 'welcome#index'
end