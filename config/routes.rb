Rails.application.routes.draw do
  get 'users/index'
  get 'posts/search'
  resources :posts, only: [:index]

  get 'static_pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
