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

class User < ActiveRecord::Base
  include Geolocatable

  validates :name, presence: true, null: false

  geocoded_by :zip
  after_validation :geocode, if: ->(obj){ obj.zip.present? && obj.zip_changed? }
end
