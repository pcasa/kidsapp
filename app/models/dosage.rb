class Dosage < ActiveRecord::Base
  attr_accessible :annual, :max_age, :min_age, :vaccine_id
  belongs_to :vaccine
  
  has_many :dr_visit_shots
  has_many :children, :through => :dr_visit_shots
  
  
  validates_presence_of :max_age, :min_age
  validates_numericality_of :max_age, :min_age, :greater_than_or_equal_to => 0
end
