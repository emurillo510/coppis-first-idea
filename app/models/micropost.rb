class Micropost < ActiveRecord::Base
	belongs_to :profile
	default_scope -> { order('created_at DESC') }
  validates :content, presence: true, length: { maximum: 140 }
  #validates :profile_id, presence: true
end