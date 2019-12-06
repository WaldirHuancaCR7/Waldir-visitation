class RequestVisitsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_student, only: [:show, :update]

  def index
  end

  def show
    @visit = Visit.new
    @person = @student.person.decorate
  end

  def update
    @visit = Visit.create(student_id: @student.id, visit_date: DateTime.now, user: current_user, status: 'in_process')
    redirect_to visit_path(id: @visit.id)
  end

  private
  def find_student
    @student = Student.find(params[:id])
  end
end