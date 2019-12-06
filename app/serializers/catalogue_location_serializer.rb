class CatalogueLocationSerializer < ApplicationSerializer
  attributes :id,
             :name,
             :parent_id,
             :catalogue_type

end
