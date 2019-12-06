require 'rails_helper'

RSpec.describe('Visits', :students, type: :routing) do
  it 'for list' do
    should route(:get, '/api/v1/visits').to(
      controller: 'api/v1/visits',
      action: :index
    )
  end
end