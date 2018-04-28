class CreateSubjectStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :subject_students do |t|

      t.timestamps
    end
  end
end
