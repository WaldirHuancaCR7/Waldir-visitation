class Api::V1::VisitsController < Api::V1::BaseController
  def index
    visits = Visit.all.search_by_params(params).where(user_id: current_user.id)
    paginate json: visits, per_page: 10, each_serializer: VisitSerializer
  end
end
