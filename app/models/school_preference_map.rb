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

  LOCATION_TYPE = %(Rural Urban Suburban)

  SPORTS = [["Football",17633],
["Softball",17634],
["Wrestling",17635],
["Men's Basketball",17638],
["Women's Basketball",17639],
["Men's Rowing",17644],
["Women's Rowing",17645],
["Men's Diving",17652],
["Women's Diving",17653],
["Men's Golf",17659],
["Women's Golf",17660],
["Men's Ice Hockey",17665],
["Women's Ice Hockey",17666],
["Men's Soccer",17683],
["Women's Soccer",17684],
["Men's Swimming",17687],
["Women's Swimming",17688],
["Men's Tennis",17689],
["Women's Tennis",17690],
["Men's Track",17691],
["Women's Track",17692],
["Men's Volleyball",17695],
["Women's Volleyball",17696],
["Men's Water Polo",17701],
["Women's Water Polo",17702],
["Baseball",17706],
["Men's Lacrosse",17707],
["Women's Lacrosse",17708],
["Field Hockey",17711]]

end
