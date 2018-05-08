class Addforeignkeys < ActiveRecord::Migration[5.1]
  def change
    add_reference :teacher_subjects, :teachers, foreign_key: {on_delete: :cascade}, null: false
    add_reference :teacher_subjects, :subjects, foreign_key: {on_delete: :cascade}, null: false

    add_reference :teacher_classes, :teachers, foreign_key: {on_delete: :cascade}, null: false
    add_reference :teacher_classes, :classes, foreign_key: {on_delete: :cascade}, null: false

    add_reference :students, :classes, foreign_key: {on_delete: :cascade}, null: false
    add_reference :grades, :students, foreign_key: {on_delete: :cascade}, null: false
    add_reference :absences, :students, foreign_key: {on_delete: :cascade}, null: false
    add_reference :grades, :subjects, foreign_key: {on_delete: :cascade}, null: false
  end
end
