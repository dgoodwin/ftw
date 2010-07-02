class Member < ActiveRecord::Base
  belongs_to :league
  belongs_to :user

  # TODO: only one per user + league
end

