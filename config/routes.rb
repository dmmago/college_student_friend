Rails.application.routes.draw do



  namespace :admin do
    get 'homes/top'
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

  resources :chat_rooms, only: [:index]
  resources :chats, only: [:show, :create]
  resources :lectures, only: [:index, :show, :create]  do
    resource :seats, only: [:index, :create, :update]
  end
end
  namespace :admin do
    resources :lectures, only: [:index, :create, :show, :destroy, :new] do
      resource :seats, only: [:create, :new]
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
