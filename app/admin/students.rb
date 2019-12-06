ActiveAdmin.register Student do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :code,
                :person_id,
                :professional_school_id,
                :study_cycle_id,
                :study_group_id,
                :religion_id,
                :address,
                :reference,
                :student_type,
                :urgent,
                :lat,
                :lng,
                :photo,
                :church,
                :sabbath_school_class,
                :baptized,
                :church_adresss

  #
  # or
  #
  # permit_params do
  #   permitted = [:person_id, :professional_school_id, :study_cycle_id, :group_id, :religion_id, :address, :reference, :type, :urgent, :lat, :lng, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Registrar Estudiante' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :code
      input :address
      input :reference
      input :student_type, as: :select, collection: Student.student_types.map {|type| [t("students.student_types.#{type[0]}"),type[0]]}
      input :urgent
      input :lat
      input :lng
      input :photo, as: :file

      input :person_id, as: :select, collection: Person.pluck(:first_name, :id)
      input :professional_school_id, as: :select, collection: ProfessionalSchool.pluck(:name, :id)
      input :study_cycle_id, as: :select, collection: StudyCycle.pluck(:name, :id)
      input :study_group_id, as: :select, collection: StudyGroup.pluck(:name, :id)
      input :religion_id, as: :select, collection: Religion.pluck(:name, :id)
      input :church
      input :sabbath_school_class
      input :baptized
      input :church_adresss

      f.inputs do
        f.has_many :responsibles, heading: 'Responsables', allow_destroy: true do |a|
          a.input :responsible_type_id, as: :select, collection: ResponsibleType.pluck(:name, :id)
        end
      end
    end
    actions
  end

  show do
    attributes_table do
      row :address
      row :reference
      row :type
      row :urgent
      row :lat
      row :lng

      row :person
      row :professional_school
      row :study_cycle
      row :study_group
      row :religion
    end
  end

end
