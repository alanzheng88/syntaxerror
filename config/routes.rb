Rails.application.routes.draw do
  
  root 'homepage#index'

  delete '/' => 'homepage#destroy_user_session', as: :destroy_user_session

  post '/' => 'homepage#login_attempt'

  get '/administrations' => 'administrations#index'

  get '/thank-you' => 'thank_you#index'
  
  get '/payments' => 'payments#index'

  get '/shopping-cart' => 'shopping_cart#index'

  get '/products' => 'products#index'

  get '/products/:id' => 'products#show', as: :product

  delete '/products/:id' => 'products#destroy'

  get '/product-management' => 'products#new'  

  post '/product-management' => 'products#create'
 
  get '/purchase-history' => 'purchase_history#index'

  get '/users/registration' => 'users#new'
  
  post '/users/registration' => 'users#create'
 
  get '/users' => 'users#index'

  delete '/users/:id' => 'users#destroy', as: :user

  put '/user' => 'users#assign_role', as: :user_assign_role

  put '/user/:id' => 'users#unassign_role', as: :user_unassign_role
  
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
end
