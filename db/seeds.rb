# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

schools = School.create([{name: "University of Central Florida", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/15601college.jpg", mascot_name: "Knights", ipeds_id: 132903},
{name:"University of Michigan", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/15654college.jpg", mascot_name: "Wolverines", ipeds_id: 170976},
{name:"Vanderbilt University", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/15781college.jpg", mascot_name: "Commodores", ipeds_id: 221999},
{name:"University of California - San Diego", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/15596college.jpg", mascot_name: "Tritons", ipeds_id: 110680},
{name:"Pittsburg State University", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/15172college.jpg", mascot_name: "Gorillas", ipeds_id: 155681},
{name:"Delta State University", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/14333college.jpg", mascot_name: "Fighting Okra", ipeds_id: 175616},
{name:"Cardinal Stritch University", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/14086college.jpg", mascot_name: "Wolves", ipeds_id: 238430},
{name:"Georgetown College", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/14490college.jpg", mascot_name: "Tigers", ipeds_id: 156745},
{name:"Huntington University", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/14599college.jpg", mascot_name: "Foresters", ipeds_id: 150941},
{name:"Kansas City Kansas Community College", logo: "https://recruit-match.ncsasports.org/fasttrack/clientimages/14673college.jpg", mascot_name: "Blue Devils", ipeds_id: 155292}])


#  id                     :integer          not null, primary key
#  season                 :integer
#  school_size            :integer
#  location_type          :integer
#  zip                    :string
#  sport_id               :integer
#  sport_acedemic_balance :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  school_id              :integer          not null

school_preference_maps = SchoolPreferenceMap.create(
  [{ school_id: School.find_by(ipeds_id: 132903).id, season: 1, school_size: 1, location_type: 2, sport_acedemic_balance: 1 },
  { school_id: School.find_by(ipeds_id: 170976).id, season: 2, school_size: 1, location_type: 1, sport_acedemic_balance: 0 },
  { school_id: School.find_by(ipeds_id: 221999).id, season: 2, school_size: 1, location_type: 1, sport_acedemic_balance: 0 },
  { school_id: School.find_by(ipeds_id: 110680).id, season: 1, school_size: 1, location_type: 2, sport_acedemic_balance: 0 },
  { school_id: School.find_by(ipeds_id: 155681).id, season: 0, school_size: 2, location_type: 2, sport_acedemic_balance: 0 },
  { school_id: School.find_by(ipeds_id: 175616).id, season: 1, school_size: 2, location_type: 0, sport_acedemic_balance: 1 },
  { school_id: School.find_by(ipeds_id: 238430).id, season: 0, school_size: 2, location_type: 0, sport_acedemic_balance: 1 },
  { school_id: School.find_by(ipeds_id: 156745).id, season: 2, school_size: 0, location_type: 2, sport_acedemic_balance: 1 },
  { school_id: School.find_by(ipeds_id: 150941).id, season: 0, school_size: 0, location_type: 2, sport_acedemic_balance: 1 },
  { school_id: School.find_by(ipeds_id: 155292).id, season: 2, school_size: 0, location_type: 1, sport_acedemic_balance: 1 }])
