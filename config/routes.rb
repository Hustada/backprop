Rails.application.routes.draw do
	root 'articles#index'

	get '/signup', to: 'users#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	get '/test', to: 'static_pages#index'

	resources :users
	resources :articles
  
end
