class School < ActiveRecord::Base
  has_one :school_preference_map

  def coaches_for_sport(sport_id)
    # grab coach(es) from this school for athlete's sport
  end
end
