Rails.application.routes.draw do
  resources :users do
    collection do
      post '/login', to: 'users#login'
    end
  end
  resources :relations
  resources :occasions
  resources :excuses do
    collection do
      patch ':id/upvote', to: 'excuses#upvote'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
