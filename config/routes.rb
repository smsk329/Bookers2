Rails.application.routes.draw do

  # booksコントローラに紐づくルーティングを設定
  resources :books, only: [:new, :index, :show, :edit, :create]
  
  resources :users, only: [:index, :show, :edit]

  devise_for :users

  # トップ画面へのルートパスを設定
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
