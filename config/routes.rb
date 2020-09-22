Rails.application.routes.draw do

  get "/surgeries", to: "surgeries#index"
  get "/surgeries/:id", to: "surgeries#show"

  post "/surgeries/:surgery_id", to: "doctor_surgeries#create"

end
