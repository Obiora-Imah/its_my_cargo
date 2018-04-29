Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'


  namespace :api do
    namespace :v1 do
      resource :dashboard do
      	member do
      		get :route_summary
          get :shipment_data
          get :freight_data
          get :booking_data
      	end
      end
    end
  end
end
