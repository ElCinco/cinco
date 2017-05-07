Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/create_user'
  get 'admin/create_list' => 'admin#create_list_form'
  get 'admin/create_link' => 'admin#create_link_form'
  get '/admin' => 'admin#index'

  post 'admin/create_list'
  post 'admin/create_link'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
