Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
root to: "homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  get "books/index" => "books#index"
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  resource :favorites, only: [:create, :destroy]
  resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'gollowers' => 'relationships#followers', as: 'followers'
  end
  get '/search', to: 'searches#search'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end