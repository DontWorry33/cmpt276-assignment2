Rails.application.routes.draw do
  resources :trainers
  resources :tokimons
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  #match ':controller(/:action(/:id))', :via => :get
end
