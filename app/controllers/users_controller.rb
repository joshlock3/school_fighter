class UsersController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save(validate: false)
    redirect_to user_step_path(@user, User.form_steps.first)
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :zip, :season, :school_size, :location_type, :sport_id, :sport_acedemic_balance)
  end
end
