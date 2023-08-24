Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/individuals", to: "individuals#index"
  get "/individuals/:id", to: "individual#show" 
end
