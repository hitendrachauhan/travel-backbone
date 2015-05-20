Rails.application.routes.draw do
  
  resources :districts

  devise_for :admins
  
  namespace :admins do
    get "/" => "home#index"
    resources :places
    resources :districts
    
    resources :states do
      resources :districts
    end
  end

  scope 'api' do
    resources :districts
  end

  root 'admins/home#index'
end
