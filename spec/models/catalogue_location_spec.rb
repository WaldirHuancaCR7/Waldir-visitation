require 'rails_helper'

RSpec.describe CatalogueLocation, type: :model do
  describe 'associations' do
    it { belong_to(:parent).optional }
  end

  describe 'validations' do
    it { validate_presence_of(:name) }
    it { validate_presence_of(:catalogue_type) }
  end
end