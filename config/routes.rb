WPPl::Application.routes.draw do
  
  get "admin/news_managment"

  get "admin/users_managment"

  get "admin/postulates_managment"

  match "/loguj" => "sessions#new", :as => 'login'
  match '/wyloguj' => "sessions#destroy", :as => 'logout'
  match "/rejestruj" => "user#new", :as => 'register'
  #match "/admin_panel" => "pages#admin_panel", :as => 'admin_panel'
  #match "/admin_panel/news_managment" => "pages#news_managment", :as  => 'news_managment'
  match "/admin" => "pages#admin_log", :as => 'admin'
  match "admin/news_managment" => "admin#news_managment", :as => "news_managment"
  match "admin/users_managment" => "admin#users_managment", :as => "users_managment"
  match "admin/postulates_managment" => "admin#postulates_managment", :as => "postulates_managment"
  match "/language" => "application#change_language", :as => "language"
  
  resources :admins
  resources :pages
  resources :sessions
  resources :users
 
  resources :postulates

  resources :categories

  resources :comments

  resources :news

  resources :users do
   resources :comments
   #resources :news
  end

  #map.users '/users', :controller => 'user'
  root :to => 'pages#home'
 
  
  match "/about", :to => 'pages#about', :as => 'about'
  match "/archive", :to => 'pages#archive', :as => 'archive'
  match "/postulates", :to => 'pages#postulates', :as => 'postulates'
  match "/contact", :to => 'pages#contact', :as => 'contact'
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
