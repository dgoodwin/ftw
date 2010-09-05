require 'digest/sha1'

class User < ActiveRecord::Base
  # TODO: This is still flaky, updates on the object get confused with validation
  # on a field that no longer exists
#  validates_length_of :password, :within => 6..50, \
#    :message => "Password must be between 6 and 50 characters."
  validates_presence_of :email, \
    :message => "Must specify e-mail address."

  validates_uniqueness_of :email, :message => "E-mail already in use."
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email format"  
  attr_accessor :password

  has_many :members, :dependent => :destroy
  has_many :leagues, :through => :members
  has_many :permissions
  has_and_belongs_to_many :races

  def password=(pass)
    # Store cleartext as a variable to allow use of validation helpers:
    @password=pass
    self.hashed_password = Digest::SHA1.hexdigest(pass)
  end

end
