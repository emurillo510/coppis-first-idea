Cproject::Application.routes.draw do
  get "errors/file_not_found"
  get "errors/unprocessable"
  get "errors/internal_server_error"
  resources :photos

  resources :profiles do
      member do
         get :following, :followers
      end
  end
  
  resources :user_steps
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  devise_for :users, :controllers => { :registrations => "registrations" }
  root "pages#home"
  get "messages" => "pages#messages"
  get "profile" => "pages#profile"
  get "news" => "pages#news"
  get "brands" => "brands#index"
  get "brands/featured" => "brands#featured"
  get "brands/trending" => "brands#trending"
  get "retailers" => "retailers#index"
  get "retailers/featured" => "retailers#featured"
  get "retailers/trending" => "retailers#trending"
  get "photos" => "photos#index"
  get 'category/:tag', to: 'profiles#index', as: :tag
  get 'stockists/:stockists', to: 'profiles#index', as: :stockist
  get 'profiles/:id/overview' => 'profiles#get_overview', as: 'profile_get_overview'
  get 'profiles/:id/get-news' =>  'profiles#get_news', as: 'profile_get_news' 
  get 'profiles/:id/get-followers' =>  'profiles#get_followers' , as: 'profile_get_followers' 
  get 'profiles/:id/get-following' =>  'profiles#get_following' , as: 'profile_get_following' 

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

match '/404', to: 'errors#file_not_found', via: :all
match '/422', to: 'errors#unprocessable', via: :all
match '/500', to: 'errors#internal_server_error', via: :all
end
