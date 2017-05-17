Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/new_list'
  get 'admin/new_link'
  get '/admin' => 'admin#index'

  post 'admin/process_link'
  post 'admin/create_list'
  post 'admin/create_link'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
