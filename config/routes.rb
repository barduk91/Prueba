Rails.application.routes.draw do

  #Frontend company
  post 'frontend/company/register' 
  post 'frontend/company/wizard' 

  #Frontend person
  post 'frontend/person/register' 

  #Frontend user
  put 'frontend/user/delete'

  # No se puede cambiar la ruta -> es para los contactos de Google,si queremos que tenga otro nombre la ruta, usar ALIAS
  match "/contacts/google/callback" => "frontend/user#add_contact_gmail", :via => [:get] 

  match "/contacts/hotmail/callback" => "frontend/user#add_contact_hotmail", :via => [:get] 

   # Google Contacts
  match "/oauth2callback" => "frontend/user#add_contact_gmail", :via => [:get]
  # Redireccion de google contacts -> no nos da acceso a sus permisos
  match "/contacts/failure" => "frontend/user#perfil", :via => [:get]

  # Twitter
  match "/comentar/twitter" => "frontend/user#publicar_twitter", :via => [:get]
  match "/comment/twitter" => "frontend/user#request_token_twitter", :via => [:get]
  match "/oauth/callback_twitter" => "frontend/user#access_token_twitter", :via => [:get]

  # Facebook
  match "/comentar/facebook" => "frontend/user#publicar_facebook", :via => [:get]
  match "/comment/facebook" => "frontend/user#request_token_facebook", :via => [:get]
  match "/oauth/callback_facebook" => "frontend/user#access_token_facebook", :via => [:get]

  match "compartir/compartir_facebook" => "frontend/user#compartir_facebook", :via => [:post]
  match "compartir/compartir_twitter" => "frontend/user#compartir_twitter", :via => [:post]
  match "compartir/compartir_google_plus" => "frontend/user#compartir_google_plus", :via => [:post]


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
