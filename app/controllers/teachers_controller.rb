class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: []

  def show_teacher_grades
    id_ucitela = params[:teach_id]
    if (id_ucitela.to_i == current_teacher.id)
      @all_grades=ActiveRecord::Base.connection.execute("
      SELECT s3.name as stname,c2.name as trname,s2.name as prname,g.value as znamka, g.created_at as datum FROM teachers
      JOIN teacher_subjects subject ON teachers.id = subject.teachers_id
      JOIN subjects s2 ON subject.subjects_id = s2.id
      JOIN grades g ON s2.id = g.subjects_id
      JOIN students s3 ON g.students_id = s3.id
      JOIN teacher_classes tc ON teachers.id = tc.teachers_id
      JOIN classes c2 ON s3.classes_id = c2.id
      WHERE (teachers.id=" + id_ucitela + ")
")
    end
  end

  def pridaj
    @grade = Grade.new

  end
  def add_grade
    @grade = Grade.new(grade_params)

    respond_to do |format|
      if @grade.save
        format.html {redirect_to znamky_ucitela_path, notice: 'Známka úspešne pridaná'}
        #format.json {render :show, status: :created, location: @grade}
      else
        format.html {render :pridaj}
        format.json {render json: @grade.errors, status: :unprocessable_entity}
      end
    end
  end


  private
  def grade_params
    params.require(:grade).permit(:value, :students_id, :subjects_id)
  end
end
