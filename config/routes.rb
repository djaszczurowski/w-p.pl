WPPl::Application.routes.draw do 
  
  # HOME PAGE ACTIONS
   	  # postulates
   	  match "/postulaty" => "pages#postulates", :as => 'postulates'
  	  match "/postulates" => "pages#postulates", :as => 'postulates'
      match "/postulates/guns" => "pages#guns", :as => 'guns'
      match "/postulates/eu" => "pages#eu", :as => 'eu'
      match "/postulates/insurances" => "pages#insurances", :as => 'insurances'
 
 	  # about
 	  match "/about", :to => 'pages#about', :as => 'about'
  
  	  # archive
  	  match "/archive", :to => 'pages#archive', :as => 'archive'
      match "/archive/filter_archive", :to => "pages#filter_archive", :as => "filter_archive"
  		
  	  # contact
  	  match "/contact", :to => 'pages#contact', :as => 'contact'
      match "/contact/send_email", :to => "pages#send_email", :as => "send_email"
  
  # ROOT 
   	  root :to => 'pages#home'  
  	  match "/home" => "pages#home"	
  	  
  # LANGUAGE ACTION
  	  match "/language" => "application#change_language", :as => "change_language"

  # NEWS ACTIONS
  	  match "/news/:id/comments" => "news#change_is_showing_comments", :as => "change_is_showing_comments"
      match "/news/:id/is_showing_comments" => "news#is_showing_comments", :as => "is_showing_comments"
      match "/news/:id/show_comments" => "news#show_comments", :as => "show_comments"
      match "/news/:id/hide_comments" => "news#hide_comments", :as => "hide_comments"
      match "/news/:id/add_comment" => "news#add_comment", :as => "add_comment"

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
	  match "admin/news/?sort_type=:type" => "news#index", :as => "sort_news"
	  
	  # admin users_managment section
	  match "admin/users" => "users#index", :as => "users_managment"
	  match "admin/users/:id/edit" => "users#edit_by_admin", :as => "edit_user_by_admin"
	  match "admin/users/new" => "users#new", :as => "new_user"
	  match "admin/users/ban/:id/:time" => "users#ban_user", :as => "ban_user"
	  match "admin/users/:id/cancel_ban" => "users#cancel_user_ban", :as => "cancel_user_ban"
	  match "admin/users/?sort_type=:type" => "users#index", :as => "sort_users"
	  
	  # admin postulates_managment section
	  match "admin/postulates" => "postulates#index", :as => "postulates_managment"
	  match "admin/postulates/:id/edit" => "postulates#edit", :as => "edit_postulate" 
	  match "admin/postulates/new" => "postulates#new", :as => "new_postulate"
	  match "admin/postulates/?sort_type=:type" => "postulates#index", :as => "sort_postulates"
	  
	  # admin categories_managment section
	  match "admin/categories" => "categories#index", :as => "categories_managment"
	  match "admin/categories/:id/edit" => "categories#edit", :as => "edit_categories" 
	  match "admin/categories/new" => "categories#new", :as => "new_category"
	  match "admin/categories/?sort_type=:type" => "categories#index", :as => "sort_categories"
	  
	  # view settings
	  match "admin/view_settings" => "view_settings#edit", :as => "viewsettings"
   	  	
   	  # contact settings
   	  match "admin/contact_settings" => "contact_settings#edit", :as => "contactsettings"
   	  
   	  
   # RESOURCES - TO MODIFY
   	 
	  resources :view_settings 
	  resources :contact_settings  	 
	  resources :pages
	  resources :sessions
	  resources :users
	  resources :comments
	  resources :postulates
	  resources :categories
	  resources :news do
      resources :comments
    end
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
