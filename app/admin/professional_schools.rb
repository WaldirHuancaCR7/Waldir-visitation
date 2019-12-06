ActiveAdmin.register ProfessionalSchool do
  menu parent: "Catalogos"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name
  #
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  index do
    id_column
    column :name
    actions
  end

  form title: 'Registrar Escuelas Profesionales' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :name
    end
    actions
  end

   show do
    attributes_table do
      row :name
    end
  end
end
