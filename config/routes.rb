Rails.application.routes.draw do
  get :story, to: 'home#view'
  get :altitude, to: 'home#view'
  get :wedding, to: 'home#view'

  root "home#index"
end
