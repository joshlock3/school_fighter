module Geolocatable
  extend ActiveSupport::Concern

  def coordinates
    [latitude, longitude]
  end
end
