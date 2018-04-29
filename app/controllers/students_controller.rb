class StudentsController < ApplicationController

  def show_all_grades
    id_ziaka = params[:stud_id]
    @vysledok = ActiveRecord::Base.connection.execute("
    SELECT students.name as sname,s2.name as predmet,g.value as znamka ,g.created_at as datum FROM students
    JOIN subject_students student ON students.id = student.students_id
    JOIN subjects s2 ON student.subjects_id = s2.id
    JOIN grades g ON s2.id = g.subjects_id
    WHERE (students.id = "+id_ziaka+")
  ")
  end

end
