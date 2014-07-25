class Notification < ActiveRecord::Base
  attr_accessible :body, :title, :for_all_users, :user_id

  belongs_to :user

  include UsefullScopes

  validates :title, presence: true
  validates :body, presence: true
end
