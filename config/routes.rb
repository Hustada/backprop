Rails.application.routes.draw do
  get 'workouts/new'

  get 'workouts/create'

  get 'workouts/update'

  get 'workouts/edit'

  get 'workouts/destroy'

  get 'workouts/index'

  get 'workouts/show'

  get 'books/index'

  devise_for :users, controllers: { omniauth_callbacks: "callbacks" }
	root 'articles#index'

	get '/demo', to: 'static_pages#demo'
	get '/about', to: 'static_pages#about'
	get '/test', to: 'static_pages#index'

	resources :articles

	resources :books, :only => :index
end
