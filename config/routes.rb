# == Route Map
#
#     Prefix Verb   URI Pattern               Controller#Action
#      users GET    /users(.:format)          users#index
#            POST   /users(.:format)          users#create
#   new_user GET    /users/new(.:format)      users#new
#  edit_user GET    /users/:id/edit(.:format) users#edit
#       user GET    /users/:id(.:format)      users#show
#            PATCH  /users/:id(.:format)      users#update
#            PUT    /users/:id(.:format)      users#update
#            DELETE /users/:id(.:format)      users#destroy
# demos_maps GET    /demos/maps(.:format)     demos#maps
#

Rails.application.routes.draw do
  root :to => 'pages#home'

  get 'home' => 'pages#home'

  resources :users do 
    get 'newlocation' => 'users#new_location'
  end

  # Demos
  get 'demos/maps' => 'demos#maps'
end
