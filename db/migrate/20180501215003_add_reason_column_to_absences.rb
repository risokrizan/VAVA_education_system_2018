class AddReasonColumnToAbsences < ActiveRecord::Migration[5.1]
  def change
    add_column :absences, :reason, :string
  end
end
