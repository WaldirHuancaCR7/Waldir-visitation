require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { have_one(:person) }
    it { have_many(:visits) }
  end

  describe 'validations' do
    it { validate_presence_of(:user_type) }
  end
end