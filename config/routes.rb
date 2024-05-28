Rails.application.routes.draw do
  devise_for :users, skip:[:sessions, :registrations]

  devise_scope :users do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'sign_out', to: 'devise/sessions#destroy'
    get 'sign_up', to: 'devise/registrations#new'
  end
end
