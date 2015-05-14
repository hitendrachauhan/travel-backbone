Rails.application.routes.draw do
  
  devise_for :admins
  
  namespace :admins do
    get "home" => "home#index"
    resources :places
  end

  scope 'admins' do
    resources :districts
  end 

  root 'home#index'
end
