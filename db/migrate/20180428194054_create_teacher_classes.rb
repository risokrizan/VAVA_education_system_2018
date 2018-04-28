class CreateTeacherClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :teacher_classes do |t|

      t.timestamps
    end
  end
end
