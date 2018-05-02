class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name, null: false
      t.date :birth_date, null: false
      t.integer :credit_number, null: false

      t.timestamps
    end
  end
end
