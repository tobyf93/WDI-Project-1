# == Route Map
#
#         Prefix Verb   URI Pattern                              Controller#Action
#           root GET    /                                        pages#home
#           home GET    /home(.:format)                          pages#home
#  user_location GET    /users/:user_id/location(.:format)       users#new_location
#                POST   /users/:user_id/location(.:format)       users#set_location
#     user_items GET    /users/:user_id/items(.:format)          items#index
#                POST   /users/:user_id/items(.:format)          items#create
#  new_user_item GET    /users/:user_id/items/new(.:format)      items#new
# edit_user_item GET    /users/:user_id/items/:id/edit(.:format) items#edit
#      user_item GET    /users/:user_id/items/:id(.:format)      items#show
#                PATCH  /users/:user_id/items/:id(.:format)      items#update
#                PUT    /users/:user_id/items/:id(.:format)      items#update
#                DELETE /users/:user_id/items/:id(.:format)      items#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy
#         signup GET    /signup(.:format)                        users#new
#          login GET    /login(.:format)                         session#new
#                POST   /login(.:format)                         session#create
#         logout DELETE /logout(.:format)                        session#destroy
#     demos_maps GET    /demos/maps(.:format)                    demos#maps
#

Rails.application.routes.draw do
  root :to => 'pages#home'

  get 'home' => 'pages#home'

  resources :users, :except => [:new] do 
    get 'location' => 'users#new_location', :as => 'location'
    post 'location' => 'users#set_location', :as => nil
    resources :items
  end

  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'

  # Demos
  get 'demos/maps' => 'demos#maps'
end
