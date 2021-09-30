Rails.application.routes.draw do
  root to:'directories#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :directories do
    get 'show_all', on: :collection
  end
  resources :archives do
    get 'download', on: :member
  end
end
