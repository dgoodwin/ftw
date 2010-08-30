class Role < ActiveRecord::Base
  has_and_belongs_to_many :rights

  validates_presence_of :name, :key
  validates_uniqueness_of :name, :key
end