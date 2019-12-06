class Api::V1::CatalogueLocationsController < Api::V1::BaseController
  def index
    catalogues = CatalogueLocation.search_by_params(params)
    paginate json: catalogues, per_page: 10, each_serializer: CatalogueLocationSerializer
  end
end
