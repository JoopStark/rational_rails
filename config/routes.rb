Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/individuals", to: "individuals#index"
  get "/individuals/new", to: "individuals#new"
  post "/individuals", to: "individuals#create"
  
  get "/individuals/:individual_id/emitters", to: "individual_emitters#index"
  get "/individuals/:individual_id/emitters/new", to: "individual_emitters#new"
  post "/individuals/:individual_id/emitters", to: "individual_emitters#create"

  get "/individuals/:id", to: "individuals#show"
  get "/individuals/:id/edit", to: "individuals#edit" 
  patch "/individuals/:id", to: "individuals#update"

  get "/emitters", to: "emitters#index"
  get "/emitters/:id", to: "emitters#show"

end
