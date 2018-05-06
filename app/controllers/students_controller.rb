class StudentsController < ApplicationController
  before_action :authenticate_student!, only: [:show_all_grades, :show_all_absence]


  def show_all_grades
    id_ziaka = params[:stud_id]
    if (id_ziaka.to_i == current_student.id)
      @grades = ActiveRecord::Base.connection.execute("
          SELECT s2.name as predmet,students.name as sname,g.value as znamka, g.created_at as datum FROM students
          JOIN grades g ON students.id = g.students_id
          JOIN subjects s2 ON g.subjects_id = s2.id
          WHERE (students.id = " + id_ziaka + ")
        ").to_a.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show_all_absence
    id_ziaka = params[:stud_id]
    if (id_ziaka.to_i == current_student.id)
      @absence = ActiveRecord::Base.connection.execute("
        SELECT absences.id as absence_id, s.name as stname, c.name as trname, absences.when as datum, absences.reason as dovod, absences.created_at as datum_dorucenia FROM absences
        JOIN students s ON absences.students_id = s.id
        JOIN classes c ON s.classes_id = c.id
        WHERE (s.id = " + id_ziaka + ")
       ").to_a.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def show

  end

  def update
    @student=Student.find(params[:id])
    respond_to do |format|
      if @student.update(student_params)
        a=@student.id
        format.html { redirect_to "/triedy/"+current_teacher.id.to_s+"/"+a.to_s+"", notice: 'Známka úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def student_params
    params.require(:student).permit(:classes_id,:name)
  end


end
