class Member < ActiveRecord::Base
  belongs_to :league
  belongs_to :user

  validate :can_join_only_once, :account_required
  
  def can_join_only_once
    if Member.where(["league_id = ? AND user_id = ?", league.id, user.id]).length > 0
      errors.add(:user, "Cannot join a league multiple times.")
    end
  end

  def account_required
    if Account.where(["user_id = ? AND platform_id = ?", user.id, 
        league.game.platform.id]).length == 0
      errors.add(:user, "#{league.game.platform.name} account required.")
    end
  end
end

