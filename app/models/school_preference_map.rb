# == Schema Information
#
# Table name: school_preference_maps
#
#  id                     :integer          not null, primary key
#  season                 :integer
#  school_size            :integer
#  location_type          :integer
#  zip                    :string
#  sport_id               :integer
#  sport_acedemic_balance :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  school_id              :integer          not null
#

class SchoolPreferenceMap < ActiveRecord::Base
  belongs_to :school

  SEASONS = %w(Winter Summer Spring/Fall)

  S_A_BALANCE = ['Athletic Power', 'Academic Prestige']

  SIZE = %w(Small Large Medium)

  LOCATION_TYPE = %w(Rural Urban Suburban)

  SPORTS = [["Football",17633],
["Softball",17634],
["Men's Basketball",17638],
["Women's Basketball",17639],
["Men's Golf",17659],
["Women's Golf",17660],
["Men's Soccer",17683],
["Men's Volleyball",17695],
["Women's Volleyball",17696],
["Baseball",17706],
["Men's Lacrosse",17707],
["Field Hockey",17711]]

end
