ActiveAdmin.register Person do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :first_name,
                :last_name,
                :dni,
                :phone,
                :person_type,
                :user_id,
                :department_id,
                :province_id,
                :district_id


  index do
    id_column
    column :first_name
    column :last_name
    column :dni
    column :person_type
    actions
  end

  form title: 'Registrar Persona' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :first_name
      input :last_name
      input :dni
      input :phone
      input :person_type, as: :select, collection: Person.person_types.map { |user_type| [t("people.person_types.#{user_type[0]}"), user_type[0] ] }
      input :user_id, as: :select, collection: User.pluck(:email, :id)
      input :department_id, as: :select, collection: CatalogueLocation.where(catalogue_type: 'department').pluck(:name, :id)
      input :province_id, as: :select, collection: option_groups_from_collection_for_select(CatalogueLocation.where(catalogue_type: 'department'), :children, :name, :id, :name)
      input :district_id, as: :select, collection: option_groups_from_collection_for_select(CatalogueLocation.where(catalogue_type: 'province'), :children, :name, :id, :name)
    end
    actions
  end

  show do
    attributes_table do
      row :first_name
      row :last_name
      row :dni
      row :phone
      row :person_type
    end
  end
end
