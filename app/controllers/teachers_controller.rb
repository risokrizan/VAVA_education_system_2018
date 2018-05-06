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

      @all_classes = ActiveRecord::Base.connection.execute("SELECT id, name FROM classes")
      @all_students = ActiveRecord::Base.connection.execute("SELECT id, name FROM students")
    end

  end

  def show_all_absences
    id_ucitela = params[:teach_id]
    if(id_ucitela.to_i == current_teacher.id)
      @all_absences = ActiveRecord::Base.connection.execute(
          "SELECT absences.id as absence_id, s.name as stname, c.name as trname, absences.when as datum, absences.reason as dovod, absences.created_at as datum_dorucenia FROM absences
            JOIN students s ON absences.students_id = s.id
            JOIN classes c ON s.classes_id = c.id
          ")
      @all_classes = ActiveRecord::Base.connection.execute("SELECT id, name FROM classes")
      @all_students = ActiveRecord::Base.connection.execute("SELECT id, name FROM students")
    end
  end

  def add_absence
    @absence = Absence.new(absence_params)

    respond_to do |format|
      if @absence.save
        format.html {redirect_to vypis_absencii_ucitel_path, notice: 'Absencia úspešne pridaná'}
      else
        format.html {render :pridaj}
        format.json {render json: @grade.errors, status: :unprocessable_entity}
      end
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
  def add_classes
    @triedy =Classe.new(classes_params)

    respond_to do |format|
      if @triedy.save
        format.html {redirect_to vsetky_triedy_path, notice: 'Trieda úspešne pridaná'}
        #format.json {render :show, status: :created, location: @grade}
      else
        format.html {render :pridaj}
        format.json {render json: @grade.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
    @grade = Grade.find(params[:grade_id])
  end

  def edit_absence
    @absence = Absence.find(params[:abs_id])
  end

  def edit_triedy
    @triedy = Classe.find(params[:class_id])
  end

  def edit_triedy_ziaka
    @student = Student.find(params[:stud_id])
  end

  def edit_ucitel_predmet
    @predmety = TeacherSubject.find(params[:id])
  end

  def all_classes
    id_ucitela = params[:teach_id]
    if(id_ucitela.to_i == current_teacher.id)
      @all_classes = ActiveRecord::Base.connection.execute(
          "SELECT classes.id, classes.name, COUNT(students.name) FROM classes
           JOIN students ON classes.id = students.classes_id
           GROUP BY classes.name, classes.id"
      )
    end
  end

  def class_detail
    id_ucitela = params[:teach_id]
    id_triedy = params[:class_id].to_s
    if(id_ucitela.to_i == current_teacher.id)
      @detail = ActiveRecord::Base.connection.execute("
      SELECT s2.id as sid,s2.name as stname,classes.name as trname, s2.birth_date as bdate, s2.email as email, s2.last_sign_in_at as nprihlaseny  FROM classes
      join students s2 ON classes.id = s2.classes_id
      where (classes.id = "+id_triedy+")
      ")
    end
  end


  def teachers_managment
    @teachers = ActiveRecord::Base.connection.execute("SELECT * FROM teachers")
  end

  def rozcestnik
  end

  def ucitel_predmety
    @predmety = ActiveRecord::Base.connection.execute("
    SELECT teachers.id as tid,s2.name as prname,s2.difficulty as obt,s2.credits as pkreditov FROM teachers
    JOIN teacher_subjects subject ON teachers.id = subject.teachers_id
    JOIN subjects s2 ON subject.subjects_id = s2.id
    WHERE (teachers.id = "+params[:id].to_s+")
")
  end

  def ucitel_triedy

  end

  def add_subject_teacher
    @tes =TeacherSubject.new(tes_params)

    respond_to do |format|
      if @tes.save
        format.html {redirect_to ucitel_predmety_path, notice: 'Predmet úspešne pridaná'}
        #format.json {render :show, status: :created, location: @grade}
      else
        format.html {render :ucitel_predmety}
        format.json {render json: @tes.errors, status: :unprocessable_entity}
      end
    end
  end

  def download_report
    id_ziaka = params[:student_id].to_s
    @info = ActiveRecord::Base.connection.execute(
        "SELECT students.name stname, students.birth_date, res.* FROM students JOIN
          (SELECT subjects.name, grades.students_id, ROUND(avg(grades.value), 0) FROM subjects JOIN grades ON grades.subjects_id = subjects.id
          GROUP BY subjects.name, grades.students_id) res ON students.id = res.students_id
          WHERE students_id = "+id_ziaka)

  end

  private
  def grade_params
    params.require(:grade).permit(:value, :students_id, :subjects_id)
  end
  def absence_params
    params.require(:absence).permit(:when, :reason, :students_id)
  end
  def classes_params
    params.require(:triedy).permit(:name)
  end
  def tes_params
    params.require(:techersub).permit(:teachers_id,:subjects_id)
  end

end
