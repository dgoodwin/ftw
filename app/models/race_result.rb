class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :user

  validates :race, :presence => true 
  validates :user, :presence => true 
  validate :race_has_occurred, :one_submission_per_user, :block_after_final

  # Validate the race has actually occurred, otherwise nobody should be
  # submitting results for it. Returns true if race is null, this validation
  # may run before we check the race is set, but we'll let that rule catch 
  # it.
  def race_has_occurred
    if race and (Time.now < race.time)
      errors.add(:race, "Race has not yet occurred.")
    end
  end

  def one_submission_per_user
    # Skip this validation if user or race is nil:
    if race.nil? or user.nil?
      return
    end
    if RaceResult.where(["race_id = ? AND user_id = ?", race.id, user.id]).length > 0
      errors.add(:user, "You have already submitted results for this race.")
    end
  end

  def block_after_final
    if race.nil? or user.nil?
      return
    end
    if RaceResult.where(["race_id = ? AND final = ?", race.id, 't']).length > 0
      errors.add(:final, "Final race results have already been decided.")
    end
  end
end
