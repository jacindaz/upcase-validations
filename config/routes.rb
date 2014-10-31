Rails.application.routes.draw do
  root to: "pages#index"
  resources :guestbook_entries, only: [:create]
end
