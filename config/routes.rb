Rails.application.routes.draw do
  get 'beers/index'

  get 'beers/import'

  get 'main/index'

  resources :beers do
    collection {post :import}
  end

  root to: "beers#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
