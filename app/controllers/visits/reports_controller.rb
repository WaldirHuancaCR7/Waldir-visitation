class Visits::ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_visit

  def new
    @student = @visit.student
    @person = @visit.person.decorate
    @report = @visit.build_poll
  end

  def create
    @report = Poll.new(permit_params)
    @report.visit_id = @visit.id
    if @report.save
      @visit.update(status: 'closed', closing_date: DateTime.now)
      redirect_to visit_path(id: @visit.id)
    else
      @student = @visit.student
      @person = @visit.person.decorate
      render :new
    end
  end

  private
  def find_visit
    @visit = Visit.find(params[:visit_id])
  end

  def permit_params
    params.require(:poll).permit(:academic_aspect, :psychological_aspect, :health_aspect, :economic_aspect, :spiritual_aspect, :others, :evidence, derivation_ids: [])
  end
end
