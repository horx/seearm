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
    resources :images
  end

  match "products", :to => "products#index", :as => :products_lists
  match "/:id", :to => "products#show", :as => :products_details

  match "categories", :to => "categories#index", :as => :categories_lists
  match "products/c_:id", :to => "categories#show", :as => :categories_details

  match "news", :to => "news#index", :as => :news_lists
  match "news/:id", :to => "news#show", :as => :news_details

  match "guides", :to => "guides#index", :as => :guides_lists
  match "guide/:id", :to => "guides#show", :as => :guide_detail

  root :to => "home#index"
  get "/about", to: "pages#about", :as => :about
end