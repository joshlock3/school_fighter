class SchoolCoachSport < ActiveRecord::Migration
  def change
    create_table :school_coach_sports do |t|
      t.string :coach_name
      t.integer :sport_id
      t.integer :ipeds_id

      t.timestamps null: false
    end
  end
end
