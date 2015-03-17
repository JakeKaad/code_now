Rails.application.routes.draw do
  root to: "lessons#index"
  resources :lessons
end
