ActiveAdmin.register User do
  menu parent: "Usuarios"
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :password_confirmation, :user_type, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :user_type, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    id_column
    column :email
    column :user_type
    actions
  end

  form title: 'Registrar Usuario' do |f|
    inputs 'Detalles' do
      input :email
      input :password
      input :password_confirmation
      input :user_type, as: :select, collection: User.user_types.map { |user_type| [t("users.user_types.#{user_type[0]}"), user_type[0] ] }
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :user_type
    end
  end
  
end
