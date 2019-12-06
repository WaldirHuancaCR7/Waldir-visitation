class Visit < ApplicationRecord
  belongs_to :student
  belongs_to :user
  has_one :person, through: :student
  has_one :professional_school, through: :student
  enum status: { pendient: 0 , in_process: 1 , visited: 2, closed: 3}
  after_create :gen_folio
  has_one :poll
  validates :status, presence: true

  def self.search_by_params(params)
    result = self.all
    result = self.by_pattern(params[:q]) if params[:q].present?
    result = self.where(status: params[:status]) if params[:status].present?
    result
  end

  def self.by_pattern(q)
    pattern = "%#{q}%"
    joins(:person).where('visits.folio ILIKE ? OR
                           people.first_name ILIKE ? OR
                           people.last_name ILIKE ?', pattern,
                                                 pattern,
                                                 pattern)
  end

  def gen_folio
    folio_prefix = 'VIS'
    folio_num = id.to_s.rjust(6, "0")
    self.update(folio: "#{folio_prefix}#{folio_num}")
  end
end
