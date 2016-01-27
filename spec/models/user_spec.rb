# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  zip                    :string
#  season                 :integer
#  school_size            :integer
#  location_type          :integer
#  sport_id               :integer
#  sport_acedemic_balance :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
