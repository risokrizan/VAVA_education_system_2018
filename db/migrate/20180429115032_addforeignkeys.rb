class Addforeignkeys < ActiveRecord::Migration[5.1]
  def change
    add_reference :teacher_subjects, :teachers, foreign_key: true
    add_reference :teacher_subjects, :subjects, foreign_key: true

    add_reference :teacher_classes, :teachers, foreign_key: true
    add_reference :teacher_classes, :classes, foreign_key: true

    add_reference :subject_students, :subjects, foreign_key: true
    add_reference :subject_students, :students, foreign_key: true

    add_reference :students, :classes, foreign_key: true
    add_reference :grades, :students, foreign_key: true
    add_reference :absences, :students, foreign_key: true
    add_reference :grades, :subjects, foreign_key: true
  end
end
