Seearm::Application.routes.draw do
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout',:sign_up => 'register'}
  namespace :cpanel do
    root :to => "home#index"
    resources :categories
    resources :products
    resources :positions
    resources :pages
    resources :images
  end

  match "products", :to => "products#index", :as => :products_lists
  match "products/:id", :to => "products#show", :as => :products_details

  match "categories", :to => "categories#index", :as => :categories_lists
  match "categories/:id", :to => "categories#show", :as => :categories_details

  root :to => "home#index"
  get '/about', to: "pages#about", :as => :about
end