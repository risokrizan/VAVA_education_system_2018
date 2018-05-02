class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [:show_all_grades, :show_all_absence]


  def show_all_grades
    id_ziaka = params[:stud_id]
    if (id_ziaka.to_i == current_student.id)
      @grades = ActiveRecord::Base.connection.execute("
    SELECT students.name as sname,s2.name as predmet,g.value as znamka ,g.created_at as datum FROM students
    JOIN subject_students student ON students.id = student.students_id
    JOIN subjects s2 ON student.subjects_id = s2.id
    JOIN grades g ON s2.id = g.subjects_id
    WHERE (students.id = " + id_ziaka + ")
  ")
    end
  end

  def show_all_absence
    id_ziaka = params[:stud_id]
    if (id_ziaka.to_i == current_student.id)
      @absence = ActiveRecord::Base.connection.execute("
    SELECT students.name as sname, a.when as absencia, a.reason as dovod FROM students
    JOIN absences a ON students.id = a.students_id
    WHERE (students.id = " + id_ziaka + ")
   ")
    end
  end

end
