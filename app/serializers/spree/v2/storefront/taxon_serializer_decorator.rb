module Spree::Api::V2::Storefront::TaxonSerializerDecorator
  Spree::V2::Storefront::TaxonSerializer.class_eval do
    attribute :products_count
    attribute :available_brands
  end
end
