Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :artwork_shares, only: [:create, :destroy,]
  resources :artworks, only: [ :destroy, :show, :update]

  resources :users do 
    resources :artworks, only: [:index]
  end

  # get 'users/:id', to: 'users#show', as: 'user' # if we were to do by hand...

end
