Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
	root 'articles#index'

	get '/demo', to: 'static_pages#demo'
	get '/about', to: 'static_pages#about'
	get '/test', to: 'static_pages#index'

	resources :articles

	resources :workouts do
		resources :exercises
	end
	
	resources :weights

	resources :books, :only => :index
end
