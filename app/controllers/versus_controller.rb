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
    calculate_final_result
    @attrs = attribute_values
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
    @result = case params[:round_number]
              when '1'
                  calculate_round1_result
              when '2'
                calculate_round2_result
              when '3'
                calculate_round3_result
              end
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
    if points >= 3
      2
    elsif points <= 1
      0
    else
      1
    end
  end

  def calculate_final_result
    total_points = calculate_round1_result + calculate_round2_result + calculate_round3_result
    @final_result_message = if total_points >= 4
                              "Your mascot won! Looks like #{@my_school.name} is the better fit for you."
                            elsif total_points <= 2
                              "Your mascot lost! Looks like #{@opp_school.name} is the better fit for you."
                            else
                              'The mascots fought to a draw. Both these schools are a good match for you!'
                            end
  end

  def attribute_values
    [@my_school, @opp_school].map do |school|
      attrs = Hash.new
      attrs['Proximity'] = "#{@user.distance_from(school.coordinates).to_i} miles"
      attrs['Weather Type'] = SchoolPreferenceMap::SEASONS[school.preferences.season]
      attrs['School Size'] = SchoolPreferenceMap::SIZE[school.preferences.school_size]
      attrs['Location Type'] = SchoolPreferenceMap::LOCATION_TYPE[school.preferences.location_type]
      attrs['Sport Academic Balance'] = SchoolPreferenceMap::S_A_BALANCE[school.preferences.sport_acedemic_balance]
      attrs
    end
  end
end
