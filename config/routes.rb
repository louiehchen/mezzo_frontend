Rails.application.routes.draw do
	#landing page
	get '/' => 'landing#index'
	#sessions
	get '/login' => 'sessions#login'

	resources :users, except: [:index]

	resources :channels do
		resources :inputs, only: [:new, :create]
	end

end
