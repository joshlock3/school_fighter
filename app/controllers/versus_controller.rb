class VersusController < ApplicationController
  before_filter :set_user
  before_filter :set_schools, only: [:arena, :summary]
  before_filter :calculate_preferences, only: [:arena, :summary]

  def school_picker
    @schools = School.all
  end

  def arena
    # round1 = season, zip
    # round2 = location_type (urban, rural, etc.), school_size (small, medium, large)
    # round3 = sport_acedemic_balance
  end

  def summary
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_schools
    @my_school = School.find(params[:my_school_id])
    @opp_school = School.find(params[:opp_school_id])
  end

  def calculate_preferences
    @round1_result = calculate_round1_result
    @round2_result = calculate_round2_result
    @round3_result = calculate_round3_result
  end

  def calculate_round1_result
    season_result = compare_choices(:season)
    zip_result = compare_zips
    print_result(season_result + zip_result)
  end

  def calculate_round2_result
    location_type_result = compare_choices(:location_type)
    school_size_result = compare_choices(:school_size)
    print_result(location_type_result + school_size_result)
  end

  def calculate_round3_result
    print_result(compare_choices(:sport_acedemic_balance) * 2) # only one result to calculate
  end

  def compare_choices(attribute)
    my_choice = @user[attribute]
    my_school_result = @my_school.preferences[attribute]
    opp_school_result = @opp_school.preferences[attribute]

    if my_choice == my_school_result && my_choice != opp_school_result
      2 # win
    elsif my_choice == opp_school_result && my_choice != my_school_result
      0 # loss
    else
      1 # draw
    end
  end

  def compare_zips
    distance1 = @user.distance_from(@my_school.coordinates)
    distance2 = @user.distance_from(@opp_school.coordinates)
    distance1 < distance2 ? 2 : 0
  end

  def print_result(points)
    result_in_worlds =
      if points >= 3
       'win'
     elsif points <= 1
       'loss'
     else
       'draw'
     end
    "#{result_in_worlds} (#{points})"
  end
end
