class DrVisit < ActiveRecord::Base
  attr_accessible :appointment, :child_id, :dosage_ids
  belongs_to :child
  has_many :dr_visit_shots, :dependent => :destroy
  has_many :dosages, :through => :dr_visit_shots, :dependent => :destroy
  has_many :notes, as: :noteable
  
end
