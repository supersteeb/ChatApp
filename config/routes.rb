Rails.application.routes.draw do
	root "home#index"
  
  get 'messages/show'

  post 'add_friend' => 'friendships#create'
  delete 'friendships/destroy'

	resources :users
	resources :sessions, only: [:new, :create]

	resources :messages do
		collection do
			get :sent
			get :received
		end
		member do
			get 'mark_as_unread'
		end
	end

=begin
	resources :messages do
	  member do
	    get 'mark_as_unread'
	  end
	end
=end

	delete 'logout' => 'sessions#destroy'



	get '/profile' => 'users#edit'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
