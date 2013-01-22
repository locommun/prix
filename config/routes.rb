Locommun::Application.routes.draw do
  
  resources :dialogs do
    get 'dialogcomment', :on => :collection
  end
  
  resources :dialogcomments
  resources :comments

  devise_for :users

  resources :billboards do 
    
    member do
      
      get 'print_notice'    
      get 'request_activate'
      get 'activate_form'
      get 'godfather_form'
    end
    
    collection do
      post 'contactsend'
      get 'hang_up'
      get 'community_ready'
      get 'show_events'
      get 'search_billboard'
      get 'show_billboards'
      get 'print_pdf'
      get 'dialog'
      get 'dialog_accept'
      get 'search_activity'
      get 'print'
      get 'description'
      get 'contact'   
      get 'activate'
    end
 
  end
  
  resources :announcements
  resources :userjoins
  resources :bringthings
  
  resources :activateBillboards
  
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  
  match "continue_creating_dialog" => 'dialogs#finalize'
  match "dia_chat_path" => 'billboards#dialog'
  
  #Wizards
  resources :find_announcement
  resources :find_billboard
  resources :create_billboard
  
  
 
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
   root :to => 'billboards#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
