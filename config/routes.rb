Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/individuals", to: "individuals#index"
  get "/individuals/:id", to: "individuals#show" 
  get "/emitters", to: "emitters#index"
  get "/emitters/:id", to: "emitters#show"
  get "/individuals/:individual_id/emitters", to: "individual_emitters#index"
end
