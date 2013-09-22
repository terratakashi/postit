PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
  resources :posts, except: :destroy do
    member do 
      post "vote"
    end
    #seconde layer
    resources :comments, only: :create do
      member do 
        post "vote"
      end
    end
  end
  resources :categories, only: [:create, :new] 

  resources :users, only: [:create, :new, :edit, :update]

  resources :sessions, only: [:new, :create, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/signup", to: "users#new"


  get "/feedback", to: "static#feedback" 
  post "/feedback", to: "static#mail" 
  get "/tag/:categoryname", to: "categories#show", :as => "tag"


end
