# == Schema Information
#
# Table name: schools
#
#  id          :integer          not null, primary key
#  name        :string
#  logo        :string
#  mascot_name :string
#  zip         :string
#  ipeds_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class School < ActiveRecord::Base
end
