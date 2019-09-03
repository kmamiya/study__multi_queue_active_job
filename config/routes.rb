Rails.application.routes.draw do
  root to: 'contents#index'

  resources :contents

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
end
