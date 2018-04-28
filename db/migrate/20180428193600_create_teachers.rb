class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.date :birth_date
      t.integer :credit_number

      t.timestamps
    end
  end
end
