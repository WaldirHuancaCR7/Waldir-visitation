class ProfilesController < ApplicationController
  before_action :authenticate_user!
  def show
    @person = current_user.person
    @departments = CatalogueLocation.where(parent_id: nil, catalogue_type: 'department').map do |d|
      [d.name, d.id]
    end
  end

  def update
    if current_user.person.update(permit_params)
      flash[:notice] = 'Se actualizo correctamente'
    else
      flash[:alert] = 'Ocurrio un error al actualizar el usuario'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def permit_params
    params.require(:person).permit(:first_name, :last_name, :dni, :phone, :department_id, :province_id, :district_id )
  end
end