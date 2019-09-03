Rails.application.routes.draw do
  resources :contents

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
end
