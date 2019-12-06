ActiveAdmin.register Visit do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :student_id, :visit_date, :closing_date, :status, :scheduled_date, :visit_date_finished
  #
  # or
  #
  # permit_params do
  #   permitted = [:person_id, :visit_date, :closing_date, :status, :scheduled_date, :visit_date_finished]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Visitas' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :scheduled_date, as: :date_time_picker
      input :visit_date, as: :date_time_picker
      input :visit_date_finished, as: :date_time_picker
      input :closing_date, as: :date_time_picker
      input :status

      input :student_id, as: :select, collection: Student.all.map {|student| [ student.person.first_name, student.id]}
    end
    actions
  end

end
