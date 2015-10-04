JellyRating::Application.routes.draw do
  resources :users, :media
  root :to => redirect("/media")
end