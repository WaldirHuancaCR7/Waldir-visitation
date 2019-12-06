ActiveAdmin.register CatalogueLocation do
  menu parent: "Catalogos"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :parent_id, :catalogue_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :parent_id, :catalogue_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form title: 'Lugar' do |f|
    f.semantic_errors *f.object.errors.keys
    inputs 'Detalles' do
      input :name
      input :parent_id, as: :select, collection: CatalogueLocation.all.map { |c| ["#{c.catalogue_type} - #{c.name}", c.id] }
      input :catalogue_type
    end
    actions
  end
  
end
