# == Schema Information
#
# Table name: user_preferences
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
#

class UserPreference < ActiveRecord::Base
end
