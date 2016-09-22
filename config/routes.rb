Rails.application.routes.draw do
  get 'agenda_items/index'

  post 'logins/create'
  get 'sessions/create'
  delete 'sessions/destroy'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :presenters
  resources :deputations
  resources :users
  resources :agenda_items

  root to: 'static_pages#home'

  match '/volunteer', to: 'presenters#new',     via: 'get'
  match '/submit',    to: 'deputations#new',    via: 'get'
  match '/about',     to: 'static_pages#about', via: 'get'
end
