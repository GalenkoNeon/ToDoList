ToDoList::Application.routes.draw do
  devise_for :users
  get 'profile',  to: "persons#profile"
  get 'sql',      to: "pages#sql"

  resources :tasks
  resources :projects

  post 'tasks/editTaskStatus',      to: 'tasks#editTaskStatus'#, as: 'editTaskStatus' 
  post 'projects/editProjectName',  to: 'projects#editProjectName'
  post 'tasks/editTaskName',        to: 'tasks#editTaskName'
  post 'tasks/setDeadline/',        to: 'tasks#setDeadline'
  post 'tasks/swapTasks',           to: 'tasks#swapTasks'
  
  match '/todolist', to: 'pages#todolist', via: 'get'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#todolist'
  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]

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
