class Micropost < ActiveRecord::Base
	belongs_to :profile
	default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  validates :profile_id, presence: true

  # Returns microposts from the users being followed by the given user.
  def self.from_profiles_followed_by(profile)
    followed_profile_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :profile_id"
    where("profile_id IN (#{followed_profile_ids}) OR profile_id = :profile_id",
          profile_id: profile.id)
  end
end