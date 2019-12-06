class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_student, only: [:show]
  def index
  end

  def show
    @departments = CatalogueLocation.where(parent_id: nil, catalogue_type: 'department').map do |d|
      [d.name, d.id]
    end
  end

  private

  def find_student
    @student = Student.find(params[:id])
  end
end