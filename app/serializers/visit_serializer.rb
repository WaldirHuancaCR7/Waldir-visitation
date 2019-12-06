class VisitSerializer < ApplicationSerializer
  attributes :id,
             :folio,
             :status

  belongs_to :professional_school
  belongs_to :person
  belongs_to :student
end
