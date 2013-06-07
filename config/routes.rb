Seearm::Application.routes.draw do

  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout',:sign_up => 'register'}
  namespace :cpanel do
    root :to => "home#index"
    resources :categories
    resources :products
    resources :positions
    resources :pages
    resources :news
    resources :guides
    resources :teches
    resources :images
  end

  match "products", :to => "products#index", :as => :products_lists
  match "product/:id", :to => "products#show", :as => :products_details

  match "categories", :to => "categories#index", :as => :categories_lists
  match "products/c_:id", :to => "categories#show", :as => :categories_details

  match "news", :to => "news#index", :as => :news_lists
  match "news/:id", :to => "news#show", :as => :news_details

  match "guides", :to => "guides#index", :as => :guides_lists
  match "guide/:id", :to => "guides#show", :as => :guide_detail

  match "teches", :to => "teches#index", :as => :teches_lists
  match "tech/:id", :to => "teches#show", :as => :tech_detail

  get "/about", to: "pages#about", :as => :about

  root :to => "home#index"
end