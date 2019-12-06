ActiveAdmin.register Poll do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :visit_id, :academic_aspect, :others, :psychological_aspect, :health_aspect, :economic_aspect, :spiritual_aspect, :evidence, derivation_ids: []
  #
  # or
  #
  # permit_params do
  #   permitted = [:visit_id, :academic_aspect, :psychological_aspect, :health_aspect, :economic_aspect, :spiritual_aspect, :evidence]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Reportes' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :visit_id, as: :select, collection: Visit.all.map {|visit| [visit.student.person.first_name, visit.id]}
      input :academic_aspect
      input :psychological_aspect
      input :health_aspect
      input :economic_aspect
      input :spiritual_aspect
      input :others
      input :evidence, as: :file

      f.input :derivations, input_html: {multiple: true}
    end
    actions
  end

end
