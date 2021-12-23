Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "excel#newSheet"
  post "excel", to: "excel#uploadSheet"

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show]
    end
  end
end
