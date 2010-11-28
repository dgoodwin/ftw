Ftw::Application.routes.draw do 

  resources :requests

  resources :accounts

  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  resources :race_results

  resources :races

  resources :events

  resources :leagues do
    resources :seasons
    resources :members
    resources :events
  end

  resources :users do
    resources :accounts
    resources :permissions
  end


  # Non-RESTful routes:
  match 'leagues/:id/admin', :to => 'leagues#admin'
  match 'leagues/:id/members', :to => 'leagues#members'
  match 'leagues/:id/join_test_users', :to => 'leagues#join_test_users'
  match 'leagues/:id/join', :to => 'leagues#join'
  match 'leagues/:id/leaderboard', :to => 'leagues#leaderboard'

  match 'events/:id/schedule', :to => 'events#schedule'
  match 'events/:id/register', :to => 'events#register'
  match 'events/:id/unregister', :to => 'events#unregister'
  match 'events/:id/register_entire_league', :to => 'events#register_entire_league'

  match 'races/:id/host', :to => 'races#host'

  match 'requests/:id/approve', :to => 'requests#approve'
  match 'requests/:id/deny', :to => 'requests#deny'

  match 'seasons/:id/leaderboard', :to => 'seasons#leaderboard'


  root :to => "home#index"

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
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
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
  #       get :recent, :on => :collection
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
