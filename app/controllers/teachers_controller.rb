class TeachersController < ApplicationController
  before_action :authenticate_teacher!, only: []

  def show_teacher_grades
    id_ucitela = params[:teach_id]
    if (id_ucitela.to_i == current_teacher.id)
      @all_grades=ActiveRecord::Base.connection.execute("

      SELECT grades.id as grade_id,s2.name as stname ,c2.name as trname, s3.name as prname ,grades.value as znamka, grades.created_at as datum,grades.students_id as students_id, grades.subjects_id as subjects_id, grades.value FROM grades
        JOIN students s2 ON grades.students_id = s2.id
        JOIN subjects s3 ON grades.subjects_id = s3.id
        JOIN teacher_subjects s4 ON s3.id = s4.subjects_id
        JOIN teachers t ON s4.teachers_id = t.id
        JOIN classes c2 ON s2.classes_id = c2.id
      WHERE (t.id=" + id_ucitela + ")
")
    end

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

  def edit
  end

  def update
    @grade = Grade.find(params[:grade_id])
    respond_to do |format|
      if @grade.update(grade_params)
        format.html { redirect_to znamky_ucitela_path, notice: 'Známka úspešne upravená' }
        #format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @grade.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def grade_params
    params.require(:grade).permit(:value, :students_id, :subjects_id)
  end

end
