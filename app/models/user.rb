require 'digest/sha1'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, \
    :name, :location, :accounts, :accounts_attributes

  # TODO: This is still flaky, updates on the object get confused with validation
  # on a field that no longer exists
#  validates_length_of :password, :within => 6..50, \
#    :message => "Password must be between 6 and 50 characters."
  validates_presence_of :email, \
    :message => "Must specify e-mail address."

  validates_uniqueness_of :email, :message => "E-mail already in use."
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email format"  

  has_many :members, :dependent => :destroy
  has_many :leagues, :through => :members
  has_many :permissions
  has_many :accounts, :dependent => :destroy
  has_and_belongs_to_many :races

  accepts_nested_attributes_for :accounts, :allow_destroy => :true

  # Return the users one and only account for the given platform.
  def get_account(platform)
    accounts.each do |a|
      if a.platform.key == platform.key
        return a
      end
    end
    return nil?
  end

end
