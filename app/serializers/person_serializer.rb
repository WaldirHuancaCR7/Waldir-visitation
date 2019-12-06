class PersonSerializer < ApplicationSerializer
  attributes :id,
             :first_name,
             :last_name,
             :dni,
             :phone,
             :person_type

  belongs_to :department
  belongs_to :province
  belongs_to :district
end
