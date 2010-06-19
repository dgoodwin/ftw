require 'digest/sha1'

class User < ActiveRecord::Base
#    validates_length_of :login, :within => 3..40, :message => "Login must be between 3 and 40 characters"
#    validates_length_of :password, :within => 5..40, :message => "Password must be between 5 and 50 characters."
#    validates_presence_of :login, :password, :message => "Please specify login and password"
#    validates_uniqueness_of :login, :message => "Login name already in use."
    #validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"  
    attr_accessor :password

    def password=(pass)
        self.hashed_password = Digest::SHA1.hexdigest(pass)
    end
end
