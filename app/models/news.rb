class News < ActiveRecord::Base
  attr_accessible :body, :photo, :published_at, :title
  mount_uploader :photo, PhotoUploader

  validates :body, presence: true
  validates :published_at, presence: true
  validates :title,	presence: true,
                    length: { maximum: 140 }
  validates :photo, presence: true
end
