Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'my_notes', to: "class_notes#my_notes"
  resources :class_notes do
    resources :note_ratings, only: [:new, :create]
  end
  resources :domains, only: [:index, :show] do
    resources :courses
    resources :books do
      resources :ratings
      resources :reviews
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
