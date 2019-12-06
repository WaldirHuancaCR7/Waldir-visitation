ActiveAdmin.register StudyCycle do
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
  #   permitted = [:name, :professional_school_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Registrar Ciclos de Estudio' do |f|
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
