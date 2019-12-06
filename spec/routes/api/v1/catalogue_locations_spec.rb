require 'rails_helper'

RSpec.describe('catalogue_locations', :catalogue_locations, type: :routing) do
  it 'for list' do
    should route(:get, '/api/v1/catalogue_locations').to(
      controller: 'api/v1/catalogue_locations',
      action: :index
    )
  end
end