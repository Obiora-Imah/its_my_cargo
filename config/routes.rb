Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'


  namespace :api do
    namespace :v1 do
      jsonapi_resources :bookings
      jsonapi_resources :customers
      jsonapi_resources :freights
      jsonapi_resources :ports
      jsonapi_resources :routes
      jsonapi_resources :shipments
      jsonapi_resources :shippers
      jsonapi_resources :shippers
      jsonapi_resources :freight_types
      resource :dashboard do
      	collection do
      		get :route_summary
          get :shipment_data
          get :freight_data
          get :booking_data
      	end

      end
    end
  end
end
