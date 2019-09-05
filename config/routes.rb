Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :user do
    resource :url, only: [:index, :edit, :destroy]
  end
  get '/:id', to: 'url#find'
  get '/:short_url', to: 'url#show'
end
