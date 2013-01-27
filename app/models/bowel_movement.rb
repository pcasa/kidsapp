class BowelMovement < ActiveRecord::Base
  attr_accessible :bowel_time, :child_id, :color, :consistency
  
  belongs_to :child
  
  CONSISTENCY_TYPES = ["Soft", "Hard", "Watery"]
  COLOR_TYPES = ["Light", "Dark", "Green", "Brown", "Red"]
end
