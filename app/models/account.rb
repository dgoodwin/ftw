class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :platform

  validates_presence_of :platform, :name 
  validates_uniqueness_of :name, :scope => :platform_id, :case_sensitive => false
  validates_uniqueness_of :user_id, :scope => :platform_id, :case_sensitive => false
  validates_numericality_of :can_host, :only_integer => true, 
    :greater_than_or_equal_to => 0
end
