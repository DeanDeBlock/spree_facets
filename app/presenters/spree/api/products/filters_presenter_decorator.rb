module Spree::Api::Products::FiltersPresenterDecorator
  Spree::Api::Products::FiltersPresenter.class_eval do 
    def initialize(current_store, current_currency, params)
      @params = params
      @products_for_filters = find_products_for_filters(current_store, current_currency, params)
    end

    def to_h
      option_values = Spree::OptionValues::FindAvailable.new(products_scope: products_for_filters).execute
      option_values_presenters = Spree::Filters::OptionsPresenter.new(option_values_scope: option_values).to_a
      product_properties = Spree::ProductProperties::FindAvailable.new(products_scope: products_for_filters).execute
      product_properties_presenters = Spree::Filters::PropertiesPresenter.new(product_properties_scope: product_properties).to_a

      params_without_taxon = params[:filter]&.except(:taxons)

      available_taxons = 
        if params_without_taxon.present?
          Spree::Api::Dependencies
          .storefront_products_finder
          .constantize.new(
            scope: Spree::Product.includes(:taxons), 
            params: params.merge(filter: params_without_taxon)
          ).execute.map(&:taxons).flatten.uniq 
        end

      {
        option_types: option_values_presenters.map(&:to_h),
        product_properties: product_properties_presenters.map(&:to_h),
        available_taxons: available_taxons
      }
    end

    private

    attr_reader :products_for_filters, :params
  end
end
