Rails.application.routes.draw do

  
  root 'homepage#index'

  post '/authenticate' => 'homepage#authenticate'

  get '/administrations' => 'administrations#index', as: :administrations

  put '/administrations' => 'administrations#edit'

  get '/thank-you' => 'thank_you#index'

  get '/registration' => 'registrations#index', as: :registration
  
  get '/payments' => 'payments#index'

  get '/shopping-cart' => 'shopping_cart#index'
  
  get '/product-listings' => 'products#index', as: :products

  get '/item-info/:id' => 'products#show', as: :product

  get '/product-management' => 'product_management#index', as: :product_management

  get '/purchase-history' => 'purchase_history#index', as: :purchase_history

  post '/users/new' => 'users#create'

  get '/users' => 'users#index', as: :users

  delete '/user/:id' => 'users#destroy', as: :user

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
