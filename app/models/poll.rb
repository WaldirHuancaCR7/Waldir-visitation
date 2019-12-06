class Poll < ApplicationRecord
  belongs_to :visit
  has_and_belongs_to_many :derivations
  has_one_attached :evidence
  validates :academic_aspect,
            :psychological_aspect,
            :health_aspect,
            :economic_aspect,
            :spiritual_aspect,
            :others,
            :evidence, presence: true

end
