require 'auth'

class Permission < ActiveRecord::Base

  include Auth

  belongs_to :user

  validates_presence_of :role, :user, :qualifier
  validate :role_is_known
  validates_uniqueness_of :role, :scope => [:user_id, :qualifier]

  def role_is_known
    begin
      get_role(role)
    rescue
      errors.add(:role, "Role is not known: #{role}")
    end
  end

end
