Rails.application.routes.draw do

  devise_for :users

  # booksコントローラに紐づくルーティングを設定
  resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy]

  resources :users, only: [:index, :show, :edit, :update]

  # トップ画面へのルートパスを設定
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
