Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :listings

  resources :reservations do
  	collection do
  		post '/confirmation' => 'reservations#confirmation', as: :confirm
  	end
  end
end
