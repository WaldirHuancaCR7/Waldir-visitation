class AddedStudentToResponsible < ActiveRecord::Migration[6.0]
  def change
    add_reference :responsibles, :student, foreign_key: true
  end
end
