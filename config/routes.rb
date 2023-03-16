Rails.application.routes.draw do
  resources :spices
  patch "/spice/:id/rating", to: "spice#increment_ratings"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
