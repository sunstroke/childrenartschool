# -*- encoding : utf-8 -*-
Schoolf::Application.routes.draw do
  
  namespace(:admin){ resources :record_books }

  namespace(:admin){ resources :payments }

  namespace(:admin){ resources :locations }

  namespace(:admin){ resources :lessons_logs }

  namespace(:admin){ resources :attendances }

  resource :dashboard

  resources :menus 

  resources :photos
  
  resources :slideshows do
    resources :photos
  end

  get "password_resets/create"

  get "password_resets/edit"

  get "password_resets/update"

  match "logout" => "sessions#destroy", :as => "logout"
  match "login" => "sessions#new", :as => "login"
  match "signup" => "users#new", :as => "signup"
  resources :users
  resources :sessions
  match "secret" => "home#secret", :as => "secret"
  resources :password_resets
  
  # Sample resource route within a namespace:
# match '/teachers' , :to => redirect("http://2010.childrenartschool.ru/teachers")
match '/photocourses' , :to => redirect("http://2010.childrenartschool.ru/photocourses")
match '/news' , :to => redirect("http://2010.childrenartschool.ru/news")
match '/admin', :to => redirect("http://childrenartschool.ru/")


namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  resources :users
  match 'groups/actual', :to=>'groups#actual', :as=>"actual"              
  match 'groups/old', :to=>'groups#old', :as=>"old"  
  resources :groups
  resources :pages
    resources :menus do
      collection do
        post :sort
      end
    end  
  resources :live_news
  resources :directions
  
  match 'people/subscribe', :to=>'people#subscribe', :as=>"subscribe"      
  match 'people/archive', :to=>'people#archive', :as=>"archive"            
  match 'people/sms', :to=>'people#sms', :as=>"sms"              
              
  resources :people
  resources :programs
  match 'welcomes/noactive', :to=>'welcomes#noactive', :as=>"noactive_banner"        
  resources :welcomes
  resources :teachers
  resources :slideshows do
    resources :photos
  end
  
end
  match 'groups/:label/smart', :to=>'groups#smart'
  match 'groups/:label', :to=>'groups#view', :as=>"view_group"        

  resources :groups do
    resources :people
  end
  

  
  resources :pages
  resources :people    
  resources :programs
  resources :welcomes
  resources :teachers
#  get "admin"

  match ':label', :to=>'pages#view', :as=>"view_page"

  match "home/index"

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
  # root :to => "welcome#index"

  root :to => "home#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id(.:format)))'
end
