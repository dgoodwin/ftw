class Round < ActiveRecord::Base
  belongs_to :season
  has_many :races, :dependent => :destroy
  # TODO: Give it a name
end
