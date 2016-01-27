# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  zip        :string
#

class User < ActiveRecord::Base
  validates :name, presence: true, null: false

  has_one :user_preference
end
