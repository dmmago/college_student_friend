Rails.application.routes.draw do

  namespace :public do
    get 'chats/show'
  end
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
scope module: :public do
  root to: 'homes#top'

  resources :customers, only: [:index, :create, :show, :edit, :update, :destroy]
  
  resources :friend_requests, only: [:create]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
