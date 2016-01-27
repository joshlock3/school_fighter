class VersusController < ApplicationController
  def school_picker
    @schools = School.all
  end

  def arena
    @my_school = School.find(params[:my_school_id])
    @opponent_school = School.find(params[:opponent_school_id])
  end

  def summary
    @my_results
    @opponent_results
  end
end
