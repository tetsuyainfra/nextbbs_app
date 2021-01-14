Rails.application.routes.draw do
  root to: 'page#index'
  get 'page/index'
  get 'page/help'
  devise_for :admins, controllers: { sessions: 'admins/sessions' }, sign_out_via: [:get, :delete]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, sign_out_via: [:get, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
