# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Vaccine.destroy_all

Vaccine.create(:name => 'HepB', :description => 'protects against hepatitis B', :dosages_attributes =>[{:min_age => 0, :max_age => 0}, {:min_age => 1, :max_age => 2}, {:min_age => 6, :max_age => 18}])

Vaccine.create(:name => 'DTaP', :description => 'a combined vaccine that protects against diphtheria, tetanus, and pertussis (whooping cough)', :dosages_attributes =>[{:min_age => 2, :max_age => 2}, {:min_age => 4, :max_age => 4}, {:min_age => 6, :max_age => 6},{:min_age => 15, :max_age => 18}])

Vaccine.create(:name => 'PCV', :description => 'protects against pneumococcal disease', :dosages_attributes =>[{:min_age => 2, :max_age => 2}, {:min_age => 4, :max_age => 4}, {:min_age => 6, :max_age => 6},{:min_age => 12, :max_age => 15}])

Vaccine.create(:name => 'Hib', :description => 'protects against Haemophilus influenzae type b', :dosages_attributes =>[{:min_age => 2, :max_age => 2}, {:min_age => 4, :max_age => 4}, {:min_age => 6, :max_age => 6},{:min_age => 12, :max_age => 15}])

Vaccine.create(:name => 'Polio', :description => 'protects against polio, the vaccine is also known as IPV', :dosages_attributes =>[{:min_age => 2, :max_age => 2}, {:min_age => 4, :max_age => 4}, {:min_age => 6, :max_age => 18}])

Vaccine.create(:name => 'RV', :description => 'protects against infections caused by rotavirus', :dosages_attributes =>[{:min_age => 2, :max_age => 2}, {:min_age => 4, :max_age => 4}, {:min_age => 6, :max_age => 6}])

Vaccine.create(:name => 'Influenza / Flu', :description => 'protects against influenza (flu)', :dosages_attributes =>[{:annual => true, :min_age => 6, :max_age => 216}])

Vaccine.create(:name => 'MMR', :description => 'protects against measles, mumps, and rubella (German measles)', :dosages_attributes =>[{:min_age => 12, :max_age => 15}])

Vaccine.create(:name => 'Varicella', :description => 'protects against varicella, also known as chickenpox', :dosages_attributes =>[{:min_age => 12, :max_age => 15}])

Vaccine.create(:name => 'HepA', :description => 'protects against hepatitis A', :dosages_attributes =>[{:min_age => 12, :max_age => 15}])

User.destroy_all
User.create(:name => 'Peter Casanova', :email => 'peter@peter.com', :password => '123456')
