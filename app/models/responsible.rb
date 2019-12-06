class Responsible < ApplicationRecord
  belongs_to :responsible_type
  belongs_to :student
end
