class VisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_visit, only: [:show, :update]
  def index
  end
  def show
    @person = @visit.person.decorate
    @student = @visit.student
  end

  def update

    if @visit.status == 'pendient'
      @visit.visit_date = DateTime.now
    end

    if @visit.status == 'in_process'
      @visit.visit_date_finished = DateTime.now
    end

    @visit.update(permit_params)

    if @visit.status == 'visited'
      return redirect_to new_visit_report_path(visit_id: @visit.id)
    end

    redirect_to visit_path(id: @visit.id)
  end


  def create
    visit = Visit.new(permit_params)
    visit.user = current_user
    visit.status = 'pendient'
    if visit.save
      redirect_to visit_path(id: visit.id)
    else
      redirect_back(fallback_location: root_path)
    end


  end

  private
  def find_visit
    @visit = Visit.find(params[:id]).decorate
  end

  def permit_params
    params.require(:visit).permit(:student_id, :scheduled_date, :status)
  end
end