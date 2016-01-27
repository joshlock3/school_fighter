class RemoveSportAndZipFromSchoolPreferenceMap < ActiveRecord::Migration
  def change
    remove_column :school_preference_maps, :zip
    remove_column :school_preference_maps, :sport_id
  end
end
