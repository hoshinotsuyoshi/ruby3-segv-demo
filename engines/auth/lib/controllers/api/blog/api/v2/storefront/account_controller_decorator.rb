module Blog
  module Api
    module V2
      module Storefront
        module AccountControllerDecorator
          def self.prepended(base)
          end
        end
      end
    end
  end
end

::Blog::Api::V2::Storefront::AccountController.prepend(Blog::Api::V2::Storefront::AccountControllerDecorator)
