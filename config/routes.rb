Rails.application.routes.draw do
  mount V1::API => '/v1'
 
  get 'uploaders/index'


  get 'users/personal'

  get 'users/appointment'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :goods, only: [:index, :show]
  root 'home#index'
  get 'detail' => 'details#index'
  get 'appointment' => 'users#appointment'
  get 'personal' => 'users#personal'
  get 'select_car_online' => 'select_car_online#index'
  get 'advanced_select' => 'select_car_online#advanced_select'


  namespace :admin do
    root 'users#guide'
    resources :brands
    resources :orders
    resources :advertisements
    resources :faqs
    resources :users, only: [:index]
    post 'upload' => 'image_uploads#upload'
    get 'order_search' => 'orders#order_search'
    post 'create_order_search' => 'orders#create_order_search'
    get 'create_order_search' => 'orders#create_order_search'
    get 'order_check/:order_id' => 'orders#order_check', as: 'order_check'
    get 'order_check_list' => 'orders#order_check_list'
    get 'assign_service/:order_id' => 'orders#assign_service', as: 'assign_service'
    post 'create_assign_service/:order_id' => 'orders#create_assign_service', as: 'create_assign_service'
    resources :brands
  end

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
