Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]

  get 'sushis/maguro' => 'sushis#maguro'
  get 'sushis/salmon' => 'sushis#salmon'
  get 'sushis/saba' => 'sushis#saba'

  resources :sushis do
    resources :likes, only: [:create, :destroy]
  end 
  root 'sushis#index'

end
