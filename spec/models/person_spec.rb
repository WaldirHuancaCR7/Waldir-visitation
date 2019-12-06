require 'rails_helper'

RSpec.describe Person, type: :model do
  describe 'associations' do
    it { belong_to(:user) }
    it { belong_to(:department).optional }
    it { belong_to(:provice).optional }
    it { belong_to(:district).optional }
  end

  describe 'validations' do
    it { validate_presence_of(:person_type) }
    it { validate_presence_of(:first_name) }
    it { validate_presence_of(:last_name) }
    it { validate_presence_of(:dni) }
  end
end