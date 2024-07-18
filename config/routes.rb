Rails.application.routes.draw do

  resources :posts, only: %i[new create destroy index show] do
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end

  resources :ogiri_topics, only: %i[create index show]

  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  authenticated :user do
    root 'posts#index', as: :authenticated_root
  end

  unauthenticated do
    root 'posts#top', as: :unauthenticated_root
  end

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    post 'sign_in', to: 'devise/sessions#create'
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end


  resources :users do
    resource :follows, only: %i[create destroy]
      get 'followings', to: 'follows#followings'
      get 'followers', to: 'follows#followers'
  end

  resources :likes, only: %i[index]

end
