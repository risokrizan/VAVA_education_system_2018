class CreateHomes < ActiveRecord::Migration[5.1]
  def change
    create_table :homes do |t|

      t.timestamps
    end

    add_column :users, :admin, :boolean, default: false
  end
end
