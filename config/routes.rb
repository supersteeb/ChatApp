Rails.application.routes.draw do
  
  post 'add_friend' => 'friendships#create'
  delete 'friendships/destroy'

	resources :users
	resources :sessions, only: [:new, :create]

	delete 'logout' => 'sessions#destroy'

	root "home#index"

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
