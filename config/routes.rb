Rails.application.routes.draw do
  root to: "pokemons#index"
  resources :pokemons, only: [:show] do
    resources :pokeballs, only: [:new, :create]
  end

  resources :trainers, only: [:index, :show, :new, :create]
  resources :pokeballs, only: [:destroy]
end
