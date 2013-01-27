class DrVisitShot < ActiveRecord::Base
  attr_accessible :dosage_id, :dr_visit_id
  belongs_to :dr_visit, :class_name => "DrVisit", :foreign_key => "dr_visit_id"
  belongs_to :dosage, :class_name => "Dosage", :foreign_key => "dosage_id"
end
