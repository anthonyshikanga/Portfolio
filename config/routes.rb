Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "home#index"
resources :skills, only: [:index, :show] do
	resources :projects
end
namespace :admin do
	resources :skills
end
end
