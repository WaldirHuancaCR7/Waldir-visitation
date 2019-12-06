class UsersController < ApplicationController
  before_action :authenticate_user!
  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'Se actualizo correctamente'
    else
      flash[:alert] = 'Ocurrio un error al actualizar el usuario'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end