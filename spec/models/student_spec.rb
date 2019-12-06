require 'rails_helper'

RSpec.describe Student, type: :model do
  describe 'associations' do
    it { belong_to(:person) }
    it { belong_to(:professional_school) }
    it { belong_to(:study_cycle) }
    it { belong_to(:study_group) }
    it { belong_to(:religion) }
    it { have_one(:user) }
  end

  describe 'validations' do
    it { validate_presence_of(:address) }
    it { validate_presence_of(:reference) }
    it { validate_presence_of(:student_type) }
  end

  describe '::Search by params' do
    let!(:students_urgent) { create_list(:student, 2, urgent: true)}
    let!(:students) { create_list(:student, 10, urgent: false) }

    it do
      expect(Student.search_by_params({urgent: 'true'}).size).to eq(2)
    end

    it do
      expect(Student.search_by_params({}).size).to eq(12)
    end
  end
end