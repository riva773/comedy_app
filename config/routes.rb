Rails.application.routes.draw do
  resources :posts, only: %i[ new create destroy index]
  devise_for :users
  root 'posts#index'

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

end
