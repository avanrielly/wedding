Rails.application.routes.draw do
  get :story, to: 'home#view'
  get :altitude, to: 'home#view'
  get :wedding, to: 'home#view'
  get :registry, to: 'home#view'
  get :weekend, to: 'home#view'
  resources :invites do
    collection do
      get :import
      post :batch
      get :results
    end
  end
  root "home#index"
end
