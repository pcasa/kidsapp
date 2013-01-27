class Vaccine < ActiveRecord::Base
  attr_accessible :description, :name, :dosages_attributes
  has_many :dosages, :dependent => :destroy

  accepts_nested_attributes_for :dosages, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
end
