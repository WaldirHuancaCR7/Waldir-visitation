class CatalogueLocation < ApplicationRecord
  belongs_to :parent, class_name: "CatalogueLocation", optional: true
  has_many :children, class_name: "CatalogueLocation", foreign_key: "parent_id"
  enum catalogue_type: { department: 0, province: 1, district: 2}
  validates :name,
            :catalogue_type, presence: true

  def self.search_by_params(params)
    result = self
    result = self.where(catalogue_type: params[:catalogue_type]) if params[:catalogue_type].present?
    result = self.where(parent_id: params[:parent_id]) if params[:parent_id].present?
    result
  end
end
