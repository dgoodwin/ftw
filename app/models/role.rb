class Role < ActiveRecord::Base
  has_and_belongs_to_many :rights

  validates_uniqueness_of :name
end
