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
  include Geolocatable

  has_one :preferences, class_name: 'SchoolPreferenceMap'

  geocoded_by :zip
  after_validation :geocode, if: ->(obj){ obj.zip.present? && obj.zip_changed? }

  def coaches_for_sport(sport_id)
    # grab coach(es) from this school for athlete's sport
  end
end
