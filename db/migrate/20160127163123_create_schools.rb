class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :logo
      t.string :mascot_name
      t.string :zip
      t.integer :ipeds_id

      t.timestamps null: false
    end
  end
end
