# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsersController < ApplicationController
  def new
    #  season                 :integer
    #  school_size            :integer
    #  location_type          :integer
    #  zip                    :string
    #  sport_id               :integer
    #  sport_acedemic_balance :integer
    #  created_at             :datetime         not null
    #  updated_at             :datetime         not null
    @user = Struct.new(:name, :season, :school_size, :sport_id, :sport_acedemic_balance, :zip)
  end

  def create
  end

  def show
  end
end
