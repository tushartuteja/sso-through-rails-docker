# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  get 'home/logout'
  get 'guest' => 'home#guest'
  get '/' => 'home#index'
  get '/sign_in' => 'application#sign_in'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
