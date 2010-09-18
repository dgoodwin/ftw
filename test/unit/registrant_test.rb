require 'test_helper'

class RegistrantTest < ActiveSupport::TestCase

  test "can only register once" do
    r = Registrant.new(:event => events(:alien_s1_r1), :member => members(:user001_alien))
    assert !r.save
    assert r.errors[:member]
  end

end
