Rails.application.routes.draw do
	root "home#index"
  
  get 'messages/show' => 'messages#show"'

#  get '/friendships' => 'friendships#show'
 # post '/friendships' => 'friendships#create'
  #delete '/friendships' => 'friendships#destroy'

#  post 'add_friend' => 'friendships#create'
#  delete 'delete_friend' => 'friendships#destroy'
	
	resources :friendships
	
	resources :sessions, only: [:new, :create]

	resources :users do
		resources :messages do
			collection do
				get :sent
				get :received
			end
			member do
				get 'mark_as_unread'
			end
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
