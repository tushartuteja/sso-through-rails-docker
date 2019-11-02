Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/logout'
  get '/' => 'welcome#guest' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
