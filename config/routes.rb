Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/track/:id', action: :track, controller: 'track'
  get '/tickers/search', action: :search, controller: 'tickers'
end
