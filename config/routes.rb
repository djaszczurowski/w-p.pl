WPPl::Application.routes.draw do 
  # HOME PAGE ACTIONS
   	  # postulates
   	  match "/postulaty" => "pages#postulates", :as => 'postulates'
  	  match "/postulates" => "pages#postulates", :as => 'postulates'
 
 	  # about
 	  match "/about", :to => 'pages#about', :as => 'about'
  
  	  # archive
  	  match "/archive", :to => 'pages#archive', :as => 'archive'
  		
  	  # contact
  	  match "/contact", :to => 'pages#contact', :as => 'contact'  		
  
  # ROOT 
   	  root :to => 'pages#home'  
  	  match "/home" => "pages#home"	
  # LANGUAGE ACTION
  	  match "/language" => "application#change_language", :as => "change_language"
  
  # USER ACTIONS 
	  # login & register
	  match "/loguj" => "sessions#new", :as => 'login'
	  match '/wyloguj' => "sessions#destroy", :as => 'logout'
	  match "/rejestruj" => "users#new", :as => 'register'
	  	
	  # user stats
	  match "/users/:id/news" => "news#filter_news", :as => "filter_news"
	  match "/users/:id/postulates" => "postulates#filter_postulates", :as => "filter_postulates"
	  match "/users/:id/comments" => "comments#filter_comments", :as => "filter_comments"
  
  # ADMIN ACTIONS 
  	  # admin login
	  match "/admin" => "pages#admin_log", :as => 'admin'  
	  
	  # admin news_managment section
	  match "admin/news" => "news#index", :as => "news_managment"
	  match "admin/news/:id/edit" => "news#edit", :as => "edit_news"
	  match "admin/news/new" => "news#new", :as => "new_news"
	  
	  # admin users_managment section
	  match "admin/users" => "users#index", :as => "users_managment"
	  match "admin/users/:id/edit" => "users#edit_by_admin", :as => "edit_user_by_admin"
	  match "admin/users/new" => "users#new", :as => "new_user"
	  
	  # admin postulates_managment section
	  match "admin/postulates" => "postulates#index", :as => "postulates_managment"
	  match "amdin/postulates/:id/edit" => "postulates#edit", :as => "edit_postulate" 
	  match "admin/postulates/new" => "postulates#new", :as => "new_postulate"
   
   # RESOURCES - TO MODIFY
	  resources :pages
	  resources :sessions
	  resources :users
	  resources :comments
	  resources :postulates
	  resources :categories
	  resources :news
	  resources :users do
	   resources :postulates
	   resources :comments
	   resources :news
	  end
	  
  
 
  
  
  #match "/admin", :to => 'admin#new', :as => "admin_log"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
