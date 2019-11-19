Rails.application.routes.draw do
  get 'note_ratings/new'
  devise_for :users
  root to: "pages#home"
  get 'my_notes', to: "class_notes#my_notes"
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
