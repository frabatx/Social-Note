Rails.application.routes.draw do
    get 'notes/:id/users', to: 'notes#newsharing' ,as: 'new_sharing_note'
  post 'notes/:id/users', to: 'notes#createsharing' ,as: 'create_sharing_note'
  get 'notecollections/:id/users', to: 'notecollections#newsharing' ,as: 'new_sharing_notecollection'
  post 'notecollections/:id/users', to: 'notecollections#createsharing' ,as: 'create_sharing_notecollection'
  resources :notecollections
  resources :notes
  root to: "notes#index"
  devise_for :users
    as :user do
        get '/users', to: 'users/sessions#index'
        #post '/users', to: 'users/registrations#create'
        #get '/users/new', to: 'users/registrations#new' , as: "new_user"
        get '/users/:id', to: 'users/sessions#show' , as: "user"
        get '/users/:id/edit', to: 'users/sessions#edit' , as: "edit_user"
        patch '/users/:id', to: 'users/sessions#update'
        post '/users/:id/acc', to: 'users/sessions#acceptfriend' ,as: 'acc_friend'
        post '/users/:id/add', to: 'users/sessions#addfriend' ,as: 'add_friend'
        post '/users/:id/rev', to: 'users/sessions#revokefriend' ,as: 'rev_friend'
        delete '/users/:id', to: 'users/sessions#destroy'
end

    get '/friendships', to: 'friendships#index'
    delete 'friendships/:id/destroy_friendship', to: 'friendships#destroy', as: 'destroy_friendship'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
