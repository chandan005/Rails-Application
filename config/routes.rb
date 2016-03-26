Rails.application.routes.draw do

  get 'static_pages/home'

  get 'about' => 'static_pages#about'

  get 'contacts' => 'static_pages#contacts'

  get 'main/index'
  get 'plantation/list'
  get 'plantation/show'
  post 'plantation/create'
  get 'plantation/new'
  patch 'plantation/update'
  get 'plantation/edit'
  get 'plantation/edit_fruit'
  get 'plantation/destroy'

  get 'fruit/list'
  get 'fruit/show'
  post 'fruit/create'
  get 'fruit/new'
  get 'fruit/edit'
  patch 'fruit/update'
  get 'fruit/destroy'

  get 'vegetable/list'
  get 'vegetable/show'
  post 'vegetable/create'
  get 'vegetable/new'
  patch 'vegetable/update'
  get 'vegetable/edit'
  get 'vegetable/destroy'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  resources :plantation do
    resources :fruit
  end

  resource :plantation do
    resources :vegetable
  end

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
