Rails.application.routes.draw do
  get 'admin/index'
  get 'admin/create_user'
  get 'admin/create_list'
  get 'admin/create_link'
  get '/admin' => 'admin#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
