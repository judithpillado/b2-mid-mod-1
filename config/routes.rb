Rails.application.routes.draw do

  get "/surgeries", to: "surgeries#index"
  get "/surgeries/:id", to: "surgeries#show"

end
