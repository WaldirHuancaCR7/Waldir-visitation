class StudentSerializer < ApplicationSerializer
  attributes :id,
             :code,
             :student_type,
             :urgent,
             :photo,
             :address,
             :reference

  belongs_to :professional_school
  belongs_to :person
  belongs_to :study_cycle
  belongs_to :study_group

  def photo
    Rails.application.routes.url_helpers.url_for(object.photo) if object.photo.present?
  end
end
