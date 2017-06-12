Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  resources :lists,     only: [:index, :show, :create, :update, :destroy]
  resources :tasks,     only: [:create, :update, :destroy]

  post '/mark_all_done', to: 'tasks#mark_all_done'

end
