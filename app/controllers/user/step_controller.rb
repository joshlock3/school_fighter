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
    render_wizard @user
  end

  private

  def user_params(step)
    permitted_attributes = case step
                           when "identity"
                             [:name, :owner_name]
                           when "characteristics"
                             [:colour, :identifying_characteristics]
                           when "instructions"
                             [:special_instructions]
                           end

    params.require(:user).permit(permitted_attributes).merge(form_step: step)
  end

end
