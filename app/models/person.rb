class Person < ApplicationRecord
  belongs_to :user
  has_one :student
  enum person_type: { student: 0 , pastor: 1, teacher: 2}
  validates :person_type,
            :first_name,
            :last_name,
            :dni, presence: true
  validates :user, uniqueness: true
  belongs_to :department, class_name: "CatalogueLocation", optional: true
  belongs_to :provice, class_name: "CatalogueLocation", optional: true
  belongs_to :district, class_name: "CatalogueLocation", optional: true
end
