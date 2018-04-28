class CreateTeacherSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_subjects do |t|

      t.timestamps
    end
  end
end
