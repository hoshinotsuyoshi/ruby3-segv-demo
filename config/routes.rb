Blog::Core::Engine.add_routes do
  namespace :application do
    namespace :admin do
      resources :promotions do
        resources :promotion_rules
        resources :promotion_actions
      end

      resources :promotion_categories

      resources :zones

      resources :stores

      resources :countries do
        resources :states
      end
      resources :states
      resources :tax_categories

      resources :products do
        resources :product_properties
        resources :images
        resources :variants
        resources :variants_including_master
        resources :prices
      end

      resources :option_types

      resources :properties

      resources :prototypes

      resources :orders do
        resources :state_changes

        resources :customers
        resources :customer_returns

        resources :adjustments
        resources :return_authorizations
        resources :payments do
          resources :log_entries
          resources :refunds
        end

        resources :reimbursements
      end

      resources :general_settings

      resources :return_items

      resources :taxonomies do
        resources :taxons
      end

      resources :taxons

      resources :reports

      resources :reimbursement_types
      resources :refund_reasons
      resources :return_authorization_reasons

      resources :shipping_methods
      resources :shipping_categories
      resources :stock_transfers
      resources :stock_locations do
        resources :stock_movements
      end

      resources :stock_items
      resources :store_credit_categories
      resources :tax_rates
      resources :payment_methods

      resources :roles

      resources :users do
        resources :store_credits
      end
    end
  end
end
