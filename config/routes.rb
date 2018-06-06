Rails.application.routes.draw do
  
  
  root to: 'pictures#index'

  resources :favorites, only: [:create, :destroy, :index]
  
  resources :pictures do
      collection do
       post :confirm
     end
  end
  
  devise_for :users
  
  if Rails.env.development?
  mount LetterOpenerWeb::Engine, at: "/letter"
end
  
  resources :favorites, only: [:create, :destroy]
end
