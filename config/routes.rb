Rails.application.routes.draw do
  get "/projects", to: "projects#index"
  post "/contact", to: "contact#create"
  get "/health", to: "health#index"
end
