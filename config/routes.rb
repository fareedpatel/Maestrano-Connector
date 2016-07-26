Rails.application.routes.draw do
  mount Maestrano::Connector::Rails::Engine, at: '/'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
  get 'home/index' => 'home#index'
  get 'home/redirect_to_external' => 'home#redirect_to_external'
  get 'home/index' => 'home#index'
  put 'home/update' => 'home#update'
  post 'home/synchronize' => 'home#synchronize'
  match 'auth/:provider/request', to: 'oauth#request_omniauth', via: [:get, :post]
  match 'auth/:provider/callback', to: 'oauth#create_omniauth', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout_omniauth', to: 'oauth#destroy_omniauth', as: 'signout_omniauth', via: [:get, :post]
  get 'synchronizations/index' => 'synchronizations#index'
  get 'shared_entities/index' => 'shared_entities#index'

end