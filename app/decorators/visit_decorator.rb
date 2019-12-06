class VisitDecorator < ApplicationDecorator
  delegate_all
  NOT_DATE = 'Sin fecha'

  def format_scheduled_date
    unless scheduled_date.nil?
      l(scheduled_date, format: :long)
    else
      NOT_DATE
    end
  end

  def format_visit_date
    unless visit_date.nil?
      l(visit_date, format: :long)
    else
      NOT_DATE
    end
  end

  def format_visit_date_finished
    return NOT_DATE if visit_date_finished.nil?

    l(visit_date_finished, format: :long)
  end

  def format_closing_date
    unless closing_date.nil?
      l(closing_date, format: :long)
    else
      NOT_DATE
    end
  end

end
