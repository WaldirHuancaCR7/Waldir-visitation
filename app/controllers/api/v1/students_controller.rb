class Api::V1::StudentsController < Api::V1::BaseController
  def index
    students = Student.search_by_params(params)
    paginate json: students, per_page: 10, each_serializer: StudentSerializer
  end
end
