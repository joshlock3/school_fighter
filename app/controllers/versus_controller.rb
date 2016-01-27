class VersusController < ApplicationController
  before_filter :set_schools, only: [:arena, :summary]

  def school_picker
    @schools = School.all
  end

  def arena
  end

  def summary
  end

  def set_schools
    @my_school = School.find(params[:my_school_id])
    @opponent_school = School.find(params[:opponent_school_id])
  end
end
