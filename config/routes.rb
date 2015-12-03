JellyRating::Application.routes.draw do
  resources :commentaries
  resources :recommendations
  resources :avaliations
  resources :users
  resources :recommendations do
    resources :avaliations
    resources :commentaries
  end
  resources :items do
    collection do
      get :list_all
    end
    resources :avaliations
    resources :commentaries
  end
  root :to => 'home#index'
	get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
