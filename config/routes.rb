# == Route Map
#
#     Prefix Verb   URI Pattern               Controller#Action
#       root GET    /                         pages#home
#       home GET    /home(.:format)           pages#home
#      users GET    /users(.:format)          users#index
#            POST   /users(.:format)          users#create
#  edit_user GET    /users/:id/edit(.:format) users#edit
#       user GET    /users/:id(.:format)      users#show
#            PATCH  /users/:id(.:format)      users#update
#            PUT    /users/:id(.:format)      users#update
#            DELETE /users/:id(.:format)      users#destroy
#   location GET    /location(.:format)       users#new_location
#            POST   /location(.:format)       users#set_location
#      items GET    /items(.:format)          items#index
#            POST   /items(.:format)          items#create
#   new_item GET    /items/new(.:format)      items#new
#  edit_item GET    /items/:id/edit(.:format) items#edit
#       item GET    /items/:id(.:format)      items#show
#            PATCH  /items/:id(.:format)      items#update
#            PUT    /items/:id(.:format)      items#update
#            DELETE /items/:id(.:format)      items#destroy
#     signup GET    /signup(.:format)         users#new
#      login GET    /login(.:format)          session#new
#            POST   /login(.:format)          session#create
#     logout DELETE /logout(.:format)         session#destroy
#   discover GET    /discover(.:format)       pages#discover
# demos_maps GET    /demos/maps(.:format)     demos#maps
#

Rails.application.routes.draw do
  root :to => 'pages#home'

  get 'home' => 'pages#home'

  resources :users, :except => [:new] do 
    
    # resources :items
  end

  get 'location' => 'users#new_location', :as => 'location'
  post 'location' => 'users#set_location', :as => nil
  resources :items

  get 'signup' => 'users#new'
  get 'login' => 'session#new'
  post 'login' => 'session#create'
  delete 'logout' => 'session#destroy'
  get 'discover' => 'pages#discover'

  # Demos
  get 'demos/maps' => 'demos#maps'
end
