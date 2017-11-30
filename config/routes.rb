Rails.application.routes.draw do
  get 'beers/index'

  resources :beers, only: :index do
    collection do
      post :import
      post :stevie
    end
  end

  root to: "beers#index"
end
