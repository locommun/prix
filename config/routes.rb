Locommun::Application.routes.draw do
  
  resources :dialogs do
    get 'dialogcomment', :on => :collection
  end
  
  resources :dialogcomments
  resources :comments

  devise_for :users

  resources :billboards do 
    
    member do
      get 'request_activate'
      get 'activate_form'
      get 'godfather_form'
      get 'activate'
    end
    
    collection do
      get 'activate'
      get 'activate_form'
      post 'contactsend'
      get 'show_events'
      get 'dialog'
      get 'dialog_accept'
      get 'description'
      get 'sources'
      get 'contact'   
      get 'from_session'
    end
 
  end
  
  resources :announcements do
    post 'suggest_date', :on => :member
    get 'vote_date' , :on => :member
    get 'pick_date' , :on => :member
  end
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
