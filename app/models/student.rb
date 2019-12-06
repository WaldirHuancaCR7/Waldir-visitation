class Student < ApplicationRecord
  belongs_to :person
  belongs_to :professional_school
  belongs_to :study_cycle
  belongs_to :study_group
  belongs_to :religion
  has_one :user, through: :person
  validates :person, uniqueness: true
  validates :address,
            :reference,
            :student_type, presence: true
  has_many :responsibles
  accepts_nested_attributes_for :responsibles, allow_destroy: true
  has_one_attached :photo

  enum student_type: { intern: 0, extern: 1}

  def self.search_by_params(params)
    result = self.all
    result = self.by_pattern(params[:q]) if params[:q].present?
    result = self.where(urgent: true) if params[:urgent].present?

    result
  end

  def self.by_pattern(q)
    pattern = "%#{q.parameterize}%"
    joins(:person).where('people.first_name ILIKE ? OR
                           people.last_name ILIKE ? OR
                           students.code ILIKE ?', pattern,
                                                 pattern,
                                                 pattern)
  end
end
