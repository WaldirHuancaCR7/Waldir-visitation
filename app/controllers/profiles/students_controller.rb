class Profiles::StudentsController  < ApplicationController
  before_action :authenticate_user!
  before_action :find_student, only: [:show, :update]
  def show
    configs_catalogues
  end

  def update
    if @student.update(permit_params)
      flash[:notice] = 'Se actualizo correctamente'
      redirect_back(fallback_location: root_path)
    else
      configs_catalogues
      flash[:alert] = 'Ocurrio un error al actualizar el estudiante'
      render :show
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end

  def permit_params
    params.require(:student).permit(:professional_school_id,
                                    :study_cycle_id,
                                    :study_group_id,
                                    :religion_id,
                                    :sabbath_school_class,
                                    :church,
                                    :church_adresss,
                                    :baptized,
                                    :address,
                                    :reference,
                                    :urgent,
                                    :lng,
                                    :lat)
  end

  def configs_catalogues
    @professional_schools = ProfessionalSchool.pluck(:name, :id)
    @groups = StudyGroup.pluck(:name, :id)
    @cyles = StudyCycle.pluck(:name, :id)
    @religions = Religion.pluck(:name, :id)
  end
end