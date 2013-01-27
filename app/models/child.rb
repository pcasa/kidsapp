class Child < ActiveRecord::Base
  attr_accessible :name, :user_id, :birth_month, :birth_year, :shot_ids
  
  validates_presence_of :name, :birth_month, :birth_year
  
  belongs_to :user
  
  has_many :feedings
  has_many :bowel_movements
  
  
  has_many :dr_visits, :dependent => :destroy
  has_many :dr_visit_shots, :through => :dr_visits, :dependent => :destroy
  has_many :dosages, :through => :dr_visit_shots
  has_many :vaccines, :through => :dosages
  
  def to_param
    "#{id} #{name}".parameterize
  end
  
  def age
    if birth_month && birth_year
      today = Date.today
      d = Date.new(today.year, birth_month, 1)
      d.year - birth_year - (d > today ? 1 : 0)
    end
  end
  
  def age_in_months
    if birth_month && birth_year
      today = Date.today
      d = Date.new(birth_year, birth_month, 1)
      months = ((today - d) / 30).to_f
    end
  end
  
  def shots_in_age_range
    Dosage.where('(min_age <= ? and max_age >= ? or min_age <= ?)', age_in_months.to_i, age_in_months.to_i, age_in_months.to_i).order('dosages.min_age ASC').includes(:vaccine)
  end
  
  
  def pending_shots
    shots = dr_visit_shots.map(&:dosage_id)
    if shots.empty?
      shots_in_age_range.order('dosages.min_age ASC').includes(:vaccine)
    else
      shots_in_age_range.where('id not in (?)', shots).order('dosages.min_age ASC').includes(:vaccine)
    end
  end
end
