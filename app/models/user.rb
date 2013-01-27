class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :role, :name
  
  attr_accessor :name
  validate :set_name, :on => :create
  
  has_many :children
  has_many :dr_visits
  
  validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)
  
  def to_param
    "#{id} #{email}".parameterize
  end
  
  def set_name
    if name && name.match(/\A([a-zA-Z.]*)\s+([a-zA-Z.]+[a-zA-Z.]*)/)
      name.gsub(';','') # clean out semi colons
      tmp_name = name.split(" ")
      self.first_name = tmp_name.first
      self.last_name = last_name = name.gsub("#{tmp_name.first} ", "") #to remove leading space too.
    else
      errors.add(:name, "Full Name required") 
    end unless self.first_name.present? && self.last_name.present?
  end
  
end
