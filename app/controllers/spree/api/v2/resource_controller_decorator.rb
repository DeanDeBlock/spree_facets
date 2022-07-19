module Spree::Api::V2::ResourceControllerDecorator
  Spree::Api::V2::ResourceController.class_eval do
    # def scope(skip_cancancan: false) 
    #   ap 'w00t'
    #   base_scope = model_class.for_store(current_store)
    #   base_scope = base_scope.accessible_by(current_ability, :show) unless skip_cancancan
    #   base_scope = base_scope.includes(products: [product_properties: :property]) if scope_includes.any? && action_name == 'index'
    #   base_scope
    # end
  end
end
