Planner::Application.routes.draw do
  resources :providers

  resources :activities

  resources :days

  resources :segments

  resources :plans

  resources :preferences

  resources :profiles

  resources :users
  
  resource :session
  
  resource :wizard

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  root 'wizards#index'
  get '/step_two' => "wizards#step_two", :as => "step_two"
  get '/step_three' => "wizards#step_three", :as => "step_three"

  # the login page
  get '/signin' => "sessions#new" , :as => "signin"
  # the login action
  get '/login' => "sessions#create", :as => "login"
  # the logout action
  delete '/logout' => "sessions#destroy", :as => "logout"
   
  get '/customize' => "plans#customize", :as => "customize" 
  post '/save_plan' => "plans#save_for_user", :as => "save_plan" 
  # for adding/deleting segments/days when creating a plan
  get '/add_segment' => "plans#add_segment", :as => "add_segment"
  get '/delete_segment' => "plans#delete_segment", :as => "delete_segment"
  get '/add_day' => "plans#add_day", :as => "add_day"
  get '/delete_day' => "plans#delete_day", :as => "delete_day"
   
  get '/daybyday' => "segments#daybyday", :as => "daybyday"
  get '/summary' => "segments#summary", :as => "summary"
  get '/choose' => "segments#choose", :as => "choose"
  post '/swap' => "segments#swap", :as => "swap"
  
end
