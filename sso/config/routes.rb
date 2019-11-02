Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/verify_token'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'welcome#index'
end
