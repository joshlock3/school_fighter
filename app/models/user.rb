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
  cattr_accessor :form_steps do
    %w(region size focus)
  end

  attr_accessor :form_step

  validates :zip, :season, presence: true, if: -> { required_for_step?(:region) }
  validates :school_size, :location_type, presence: true, if: -> { required_for_step?(:size) }
  validates :sport_id, :sport_acedemic_balance, presence: true, if: -> { required_for_step?(:focus) }

  def required_for_step?(step)
    return true if form_step.nil?
    return true if form_steps.index(step.to_s) <= form_steps.index(form_step)
  end
end
