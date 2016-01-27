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
end
