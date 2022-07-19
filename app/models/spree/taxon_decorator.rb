module Spree::TaxonDecorator
  def products_count
    products.size
  end

  def available_brands
    products.map do |product|
      product_property = product.product_properties.find { |pp| pp.property_name == 'brand' }

      next unless product_property.present?

      {
        name: product_property.value,
        filter_param: product_property.filter_param,
      }
    end.compact.flatten.uniq
  end
end

Spree::Taxon.prepend Spree::TaxonDecorator
