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
  
  resources :customers, only: [:index, :create, :show, :edit, :update]
  get 'customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch 'customers/:id/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  resources :friend_requests, only: [:create, :index]
  resources :chat_rooms, only: [:index]
  resources :chats, only: [:show, :create]
  resources :lectures, only: [:index, :show, :create, :update]  do
    resource :seats, only: [:index, :create, :update]
  end
end
  namespace :admin do
    resources :lectures, only: [:index, :create, :destroy, :new] do
      resource :seats, only: [:create, :new]
  end
    resources :customers, only: [:index, :show, :update]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
