class Profile < ActiveRecord::Base
	belongs_to :user
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
        has_many :followed_profiles, through: :relationships, source: :followed
       
        has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
        has_many :followers, through: :reverse_relationships, source: :follower


  def following?(other_profile)
    relationships.find_by(followed_id: other_profile.id)
  end

  def follow!(other_profile)
    relationships.create!(followed_id: other_profile.id)
  end

  def unfollow!(other_profile)
    relationships.find_by(followed_id: other_profile.id).destroy
  end

end
