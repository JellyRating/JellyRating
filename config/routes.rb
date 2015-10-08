JellyRating::Application.routes.draw do
  resources :media_avaliations
  resources :users
  resources :media do
    collection do
      get :list_all
    end
    resources :media_avaliations
  end
  root :to => redirect("/media")
	get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
