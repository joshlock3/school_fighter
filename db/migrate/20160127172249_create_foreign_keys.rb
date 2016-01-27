class CreateForeignKeys < ActiveRecord::Migration
  def change
    add_column :school_preference_maps, :school_id, :integer, null: false
  end
end
