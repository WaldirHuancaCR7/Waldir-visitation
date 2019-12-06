class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    user_type = current_user.user_type
    self.send(user_type)
    render("#{user_type}")
  end

  private

  def student
    @student = current_user.person.student
    @departments = CatalogueLocation.where(parent_id: nil, catalogue_type: 'department').map do |d|
      [d.name, d.id]
    end
  end
  def visitor
    @last_months = current_user.visits.group(:status).group_by_month(:created_at, last: 5, format: "%B").count
    @last_week = current_user.visits.group(:status).group_by_day(:created_at, format: "%a").count
  end

end