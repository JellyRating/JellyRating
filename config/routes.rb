JellyRating::Application.routes.draw do
  resources :users, :media
  root :to => redirect("/media")
	get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end