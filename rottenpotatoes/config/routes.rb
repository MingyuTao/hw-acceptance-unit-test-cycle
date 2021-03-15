Rottenpotatoes::Application.routes.draw do
  resources :movies 
  
  match "/movies/same_director/:id", to: "movies#same_director", via: :get, as: :same_director
  
  
  #get "/movies/same_director/:id", controller: "/movies/same_director"
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
end
