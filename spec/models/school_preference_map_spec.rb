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
#

require 'rails_helper'

RSpec.describe SchoolPreferenceMap, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
