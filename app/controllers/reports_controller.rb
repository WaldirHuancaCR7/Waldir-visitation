class ReportsController < ApplicationController
  before_action :authenticate_user!
  def show
    @visits = Visit.all.where(user_id: current_user.id)
    @from = params[:from]
    @to = params[:to]
    @visits = @visits.where(created_at: (@from.to_datetime)..(@to.to_datetime)) if @from.present? && @to.present?
    render xlsx: "report", filename: "report.xlsx", template: "reports/report.xlsx.axlsx" if params[:commit] == 'Descargar'
    @visits = @visits.group(:status).group_by_month(:created_at, last: 5, format: "%B").count
  end

end