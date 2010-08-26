class RaceResult < ActiveRecord::Base
  belongs_to :race
  belongs_to :user

  has_many :rows, :class_name => 'RaceResultRow'
  accepts_nested_attributes_for :rows, :allow_destroy => true

  validates :race, :presence => true 
  validates :user, :presence => true 
  validate :all_users_accounted_for, :race_has_occurred, 
    :one_submission, :block_after_final,
    :unique_users

  def all_users_accounted_for
    submitted_users = {}
    rows.each do |row|
      if row.user
        submitted_users[row.user.login] = 1
      end
    end

    if race
      race.users.each do |user|
        if not submitted_users.has_key?(user.login)
          errors.add(:rows, "Results missing for user: %s" % user.login)
        end
      end
    end
  end

  # Validate the race has actually occurred, otherwise nobody should be
  # submitting results for it. Returns true if race is null, this validation
  # may run before we check the race is set, but we'll let that rule catch 
  # it.
  def race_has_occurred
    if race and (Time.now < race.time)
      errors.add(:race, "Race has not yet occurred.")
    end
  end

  # Until we allow user submissions:
  def one_submission
    # Skip this validation if user or race is nil:
    if race.nil? or user.nil?
      return
    end
    # Edits
    if not id.nil?
      if RaceResult.where(["race_id = ? and id != ?", race.id, id]).length > 0
        errors.add(:race, "Results already submitted for this race.")
      end
    # Creates
    else
      if RaceResult.where(["race_id = ?", race.id]).length > 0
        errors.add(:race, "Results already submitted for this race.")
      end
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

  def unique_users
    if rows.nil?
      return
    end

    users_seen = {}
    rows.each do |row| 
      if row.user and users_seen.has_key?(row.user.id)
        errors.add(:rows, 
                   "User '%s' appears in results more than once." % row.user.name)
        return
      elsif row.user
        users_seen[row.user.id] = 1 # value is irrelevant here
      end
    end
  end
end
