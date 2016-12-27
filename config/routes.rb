Rails.application.routes.draw do
  devise_for :admin, :controllers => { :sessions => "admin/sessions", :passwords => "admin/passwords", :registrations => "admin/registrations" }
  namespace :admin do
    get 'orders/index'
  end

  mount V1::API => '/v1'
  mount ChinaCity::Engine => '/china_city'

  get 'uploaders/index'


  get 'users/personal'

  get 'users/appointment'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'
  post 'login' => 'sessions#create'
  get 'detail/:id' => 'details#index'
  get 'send_msg' => 'auth_code#send_msg'
  get 'appointment' => 'users#appointment'
  get 'personal' => 'users#personal'
  get 'select_car_online' => 'select_car_online#index'
  get 'advanced_select' => 'select_car_online#advanced_select'
  get 'products/:id/goods' => 'goods#index', as: :goods
  get 'goods/:good_id/orders/new' => 'orders#new', as: :new_orders
  post 'goods/:good_id/orders' => 'orders#create', as: :orders

  namespace :admin do
    root 'users#guide',as: :guide
    resources :brands
    resources :orders do 
      collection do
        post 'search'
      end
    end
    resources :advertisements
    resources :faqs
    resources :albums do
      resources :photos, shallow: true
    end
    # resources :photos
    resources :users, only: [:index]
    post 'upload' => 'image_uploads#upload'
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
