class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.integer :season
      t.integer :school_size
      t.integer :location_type
      t.string :zip
      t.integer :sport_id
      t.integer :sport_acedemic_balance

      t.timestamps null: false
    end
  end
end
