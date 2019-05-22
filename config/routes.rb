Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: "home#index", as: :root
    resources :item, controller: "items", only: [:index, :show] do
      get "result", on: :collection
    end
    resources :rating, controller: 'rating', only: [:create] do
      get "destroyAll", on: :collection
    end

  end

  unauthenticated :user do
    root to: "home#indexAnonymous", as: :root_anonymous
  end

  get "/about", to: "home#about", as: :about

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
