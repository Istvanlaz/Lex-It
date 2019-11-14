Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :domains, only: [:index, :show] do
    resources :courses do
      resources :class_notes
    end
    resources :books do
      resources :ratings
      resources :reviews
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
