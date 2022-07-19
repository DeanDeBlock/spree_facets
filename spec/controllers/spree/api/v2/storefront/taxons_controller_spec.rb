RSpec.describe Spree::Api::V2::Storefront::TaxonsController, type: :request do
  let(:user) do
    create(:user)
  end

  let(:headers) do 
    headers_bearer
  end

  let!(:categories) do
    create(:taxonomy)
  end

  let!(:men) do
    create(:taxon, name: :men, taxonomy: categories)
  end

  let!(:shirts) do
    create(:taxon, name: :shirts, taxonomy: categories, parent: men)
  end

  let!(:product) do
    create(:product, taxons: [shirts])
  end

  include_context 'API v2 tokens'

  context '#index' do
    it 'must return a list of taxons paged' do
      get "/api/v2/storefront/taxons?include=products", headers: headers
      expect(response).to have_http_status(:ok)
      ap json
      expect(json['data'].count).to eq (25)
    end
  end
end
