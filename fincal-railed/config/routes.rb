Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

# # Resource Routes  
# 	resources :users, only: %i(create update destroy)
#   	resources :sessions, only: %i(create)

#   	#Manuall Routes
#   	#Main Routes
  	root 'users#welcome'

#   	#User Routes
#   	get '/user/profile' => 'users#profile'
#   	get '/login' => 'users#login'
#   	get '/signup' => 'users#new'
#     post '/user/updatepassword' => 'users#changePassword'

#     #Sessions Routes
#     get 'session/destroy' => 'sessions#destroy'

#   root 'main#index'
   get '/tvom' => 'accounts#tvom' #, as: :tvom_landing
#   resources :accounts 
	post '/tvom/results' => 'accounts#tvom_results', as: :tvom_choice

	get '/about' => 'users#about', as: :about
	
resource :users, only: %i(new create update destroy) do
  resources :accounts
end

#maybe this resource needs to be singular?
resource :sessions, only: [:new, :create, :destroy]




end
