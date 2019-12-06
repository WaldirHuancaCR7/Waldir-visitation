class ApplicationController < ActionController::Base
  before_action :config_menu
  include Pundit

  private
  def config_menu
    self.send("menu_#{current_user.user_type}") if current_user
  end
  def menu_visitor
    @menu = [
      {name: 'Tablero', url: root_path},
      {name: 'Solicitar Visita', url: request_visits_path},
      {name: 'Visitas', url: visits_path},
      {name: 'Estudiantes', url: students_path},
      {name: 'Reportes', url: report_path}
    ]
  end

  def menu_student
    @menu = [
    ]
  end
end
