class User::StepsController < ApplicationController
  include Wicked::Wizard
  steps *User.form_steps

  def show
    @user = User.find(params[:user_id])
    render_wizard
  end

  def update
    @user = User.find(params[:user_id])
    @user.update(user_params(step))
    unless step == "focus"
      render_wizard @user
    else
      redirect_to school_picker_versus_path
    end
  end

  private

  def user_params(step)
    permitted_attributes = case step
                           when "region"
                             [:zip, :season]
                           when "size"
                             [:school_size, :location_type]
                           when "focus"
                             [:sport_id,
                             :sport_acedemic_balance]
                           end

    params.require(:user).permit(permitted_attributes).merge(form_step: step)
  end

end
