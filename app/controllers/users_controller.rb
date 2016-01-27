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

class UsersController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.save(validate: false)
    binding.pry
    redirect_to user_step_path(@user, User.form_steps.first)
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def pet_params
    params.require(:user).permit(:name, :zip, :season, :school_size, :location_type, :sport_id, :sport_acedemic_balance)
  end
end
