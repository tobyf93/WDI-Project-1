# == Route Map
#
#           Prefix Verb   URI Pattern                           Controller#Action
#             root GET    /                                     pages#home
#             home GET    /home(.:format)                       pages#home
# user_newlocation GET    /users/:user_id/newlocation(.:format) users#new_location
#            users GET    /users(.:format)                      users#index
#                  POST   /users(.:format)                      users#create
#        edit_user GET    /users/:id/edit(.:format)             users#edit
#             user GET    /users/:id(.:format)                  users#show
#                  PATCH  /users/:id(.:format)                  users#update
#                  PUT    /users/:id(.:format)                  users#update
#                  DELETE /users/:id(.:format)                  users#destroy
#           signup GET    /signup(.:format)                     users#new
#            login GET    /login(.:format)                      session#new
#                  POST   /login(.:format)                      session#create
#                  DELETE /login(.:format)                      session#destroy
#       demos_maps GET    /demos/maps(.:format)                 demos#maps
#

Rails.application.routes.draw do
  root :to => 'pages#home'

  get 'home' => 'pages#home'

  resources :users, :except => [:new] do 
    get 'newlocation' => 'users#new_location'
  end

  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  # Demos
  get 'demos/maps' => 'demos#maps'
end
