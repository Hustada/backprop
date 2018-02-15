Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'callbacks', registrations: 'registrations', confirmations: 'confirmations' }

  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

	root 'articles#index'

	get '/prism', to: 'static_pages#prism'

	get '/demo', to: 'static_pages#demo'
	get '/about', to: 'static_pages#about'
	get '/test', to: 'static_pages#index'

	resources :articles do
		get 'tag_list', :on => :collection
		get 'list_all', :on => :collection
	end

	resources :workouts do
		resources :exercises
	end

	resources :exercises do
		resources :weights
	end

	resources :workouts do
		member do
			put :is_finished
			put :unfinish
		end
	end

	resources :exercises do
		member do
			put :is_finished
			put :unfinish
		end
	end

	get 'tags/:tag', to: 'articles#tag_list', as: :tag

	resources :books, :only => :index
end
