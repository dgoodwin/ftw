class Member < ActiveRecord::Base

  # Technically, user is unecessary here as it's already on account:
  belongs_to :league
  belongs_to :user
  belongs_to :account
  has_many :registrants, :dependent => :destroy

  validates_presence_of :account, :league, :user

  validate :can_join_only_once, :account_required, :account_belongs_to_user
  
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

  def account_belongs_to_user
    if user.id != account.user.id
      errors.add(:account, "Account does not belong to user.")
    end
  end

end

