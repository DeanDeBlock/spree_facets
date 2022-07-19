module Spree::Api::V2::Storefront::ProductsControllerDecorator
  Spree::Api::V2::Storefront::ProductsController.class_eval do 
    # def sorted_collection
    #   # ap 'w00t'
    #   # ap params
    #   # ap allowed_sort_attributes
    #   # ap collection
    #   # ap collection_sorter.new(collection, current_currency, params, allowed_sort_attributes).call
    #   # collection_sorter.new(collection, current_currency, params, allowed_sort_attributes).call
    #   @sorted_collection ||= collection_sorter.new(collection, params, allowed_sort_attributes).call
    # end

    # def collection_sorter
    #   Spree::Api::Dependencies.storefront_collection_sorter.constantize
    # end
    def product_list_includes
      {
        product_properties: [],
        option_types: [],
        variant_images: []
      }
    end
  end
end
