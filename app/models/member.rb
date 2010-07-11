class Member < ActiveRecord::Base
  belongs_to :league
  belongs_to :user

  validate :can_join_only_once
  
  def can_join_only_once
    if Member.where(["league_id = ? AND user_id = ?", league.id, user.id]).length > 0
      errors.add(:user, "Cannot join a league multiple times.")
    end
  end
end

