Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  namespace :v1 do
    resources :users
    resources :companies
    resources :jobs
    resources :messages
    resources :conversations

    post "auth/sign_in", to: "authentication#sign_in"
    post "auth/sign_up", to: "authentication#sign_up"
    post "auth/forgot_password", to: "authentication#forgot_password"
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
