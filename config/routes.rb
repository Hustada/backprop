Rails.application.routes.draw do
	root 'articles#index'

	get '/auth/:provider/callback', to: 'sessions#third_party'
	get '/demo', to: 'static_pages#demo'
	get '/about', to: 'static_pages#about'
	get '/signup', to: 'users#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'

	get '/test', to: 'static_pages#index'

	resources :users
	resources :articles
  
end
