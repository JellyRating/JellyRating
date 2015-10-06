JellyRating::Application.routes.draw do
  resources :users
  resources :media do
    collection do
      get :list_all
    end
  end
  root :to => redirect("/media")
	get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
