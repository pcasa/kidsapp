class Note < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :noteable, polymorphic: true
end
