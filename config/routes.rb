Rails.application.routes.draw do

  resources :todos

  resources :users do
    collection do
      post "login"
    end
  end
end
