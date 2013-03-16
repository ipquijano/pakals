Pakals::Application.routes.draw do
  resources :spam_posts

  get "sessions/new"

  resources :posts, :has_many => :comments
  resources :users
  resources :sessions
  resources :comments
  get "posts/town_posts/:town_from" => "posts#town_posts"
  get "view_posts" => "posts#view_posts"
  get "pages/home"
  get "pages/popular" 
  get "pages/latest"
  get "pages/towns"
  get "register" => "users#new", :as=> "register"
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  root :to => "pages#home"
  match 'admin/:id/ban', :to => 'admin#ban', :as => 'admin_user_ban', :via => :post
  match 'admin/:id/unban', :to => 'admin#unban', :as => 'admin_user_unban', :via => :post
  match 'admin/:id/promote', :to => 'admin#promote', :as => 'admin_user_promote', :via => :post
  match 'admin/:id/demote', :to => 'admin#demote', :as => 'admin_user_demote', :via => :post
  #get "admin_spam" => "admin#spam"
  #get "admin_unspam" => "admin#unspam"
  match 'admin/:id/spam', :to => 'admin#spam', :as => 'admin_spam', :via => :post
  match 'admin/:id/unspam', :to => 'admin#unspam', :as => 'admin_unspam', :via => :post

  get "posts/top_posts"

  get "admin/index"
  get "admin/viewAllUsers"
  get "admin/spamReports"
  get "admin/spamComments"
  #get "admin/showPostsReporters"

  #match 'posts/search' => 'posts#search', :via => :get, :as => 'search_posts'
  #match 'spam_posts/:id/mark_spam', :to => 'spam_posts#mark_spam', :as => 'post_mark_spam', :via => :post
  #match 'spam_posts/:id/unmark_spam', :to => 'spam_posts#unmark_spam', :as => 'post_unmark_spam', :via => :delete
  match 'admin/:id/showPostsReporters', :to => 'admin#showPostsReporters', :as => 'showPostsReporters', :via => :get

  resources :posts do
    resources :comments
    #resources :spam_posts
    member do
      get 'mark_spam'
      get 'like'
    end
  end

  resources :comments do
    member do
      get 'spam'
    end
  end

  resources :users do
    resources :spam_posts
  end



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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
