Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :user
  resources :travelgroup
  resources :transactiondetail
  resources :trip
  resources :split
  resources :conversion

end
