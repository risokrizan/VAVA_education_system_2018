class CreateAbsences < ActiveRecord::Migration[5.1]
  def change
    create_table :absences do |t|
      t.date :when

      t.timestamps
    end
  end
end
