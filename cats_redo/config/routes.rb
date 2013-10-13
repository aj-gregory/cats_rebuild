CatsRedo::Application.routes.draw do
  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]
  resources :cats do
    resources :cat_rental_requests, :only => [:new, :create]
  end
  resources :cat_rental_requests, :except => [:new, :create, :index]
end
