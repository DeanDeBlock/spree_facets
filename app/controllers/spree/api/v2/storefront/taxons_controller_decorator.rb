module Spree::Api::V2::Storefront::TaxonsControllerDecorator
  Spree::Api::V2::Storefront::TaxonsController.class_eval do
    def serializer_params
      super.merge(include_products: action_name == 'show' || params[:include]&.include?('products'))
    end
  end
end
