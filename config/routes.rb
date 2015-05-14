Rails.application.routes.draw do
  
  resources :districts

  devise_for :admins
  
  namespace :admins do
    get "home" => "home#index"
    resources :places
  end

  scope 'api' do
    resources :districts
  end 

  root 'home#index'
end
