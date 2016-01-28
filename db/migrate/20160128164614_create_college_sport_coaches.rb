class CreateCollegeSportCoaches < ActiveRecord::Migration
  def change
    create_table :college_sport_coaches do |t|
      t.string :college_name
      t.string :coach_name
      t.string :coach_position
      t.integer :school_id
      t.integer :sport_id
      t.string :sport_name

      t.timestamps null: false
    end
  end
end
