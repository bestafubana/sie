Sie::Application.routes.draw do

  root :to => 'login#index'

  get '/home' => 'contatos#index'
  get '/registration' => 'login#registration'
  post '/register' => 'login#register'
  post '/authenticate' => 'login#authenticate'
  post '/logout' => 'login#logout'

  resources :demandas
  
  get "/consultas/list/:tipo_demanda" => "demandas#list"
  get "/consultas/relatorio/:tipo_demanda/:mes" => "demandas#relatorio_consulta"
  match "/consultas/new" => "demandas#new_consulta"
  match "/levantamentos/new" => "demandas#new_levantamento"
  match "/flagrantes/new" => "demandas#new_flagrante"
  get "/flagrantes/edit_flagrante/:id" => "demandas#edit_flagrante"
  get "/levantamentos/edit_levantamento/:id" => "demandas#edit_levantamento"
  get "/consultas/edit_consulta/:id" => "demandas#edit_consulta"

  #resources :consultados


  resources :usuarios


  #resources :status_consulta


  #resources :tipo_demandas


  resources :contatos


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
