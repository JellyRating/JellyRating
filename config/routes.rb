JellyRating::Application.routes.draw do
  resources :users, :medias
  root :to => redirect("/medias")
end