Rails.application.routes.draw do
  root 'pages#home'

  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions', omniauth_callbacks: 'omniauth_callbacks'}
  get 'pages/about'
  get 'pages/contact'
  get 'pages/terms'

  resources :users do
    collection do
      get 'search'
    end
  end

end
