class Feeding < ActiveRecord::Base
  attr_accessible :amount, :feeding_time, :unit, :child_id
  belongs_to :child
end
