class Group < ActiveRecord::Base
  extend FriendlyId
  friendly_id :permalink, use: :slugged

  belongs_to :user
  validates :user_id, presence: true
  validates :name, presence: true
  validates :permalink, format: { with: /\A[\w+]+\z/ }, length: { maximum: 20 },
                uniqueness: { case_sensitive: false },
                presence: true

  geocoded_by :address
  after_validation :geocode, :if => :address_changed?

#  mount_uploader :profilepic, ProfilepicUploader

end
