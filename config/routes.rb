Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "home#index"
resources :skills, only: [:index, :show]
namespace :admin do
	resources :skills
end
end
