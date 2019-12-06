require 'rails_helper'

RSpec.describe('Students', :students, type: :routing) do
  it 'for list' do
    should route(:get, '/api/v1/students').to(
      controller: 'api/v1/students',
      action: :index
    )
  end
end