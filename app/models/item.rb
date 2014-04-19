class Item < ActiveRecord::Base
  attr_accessible :price, :title, :for_all_users, :user_id

  belongs_to :user

  include UsefullScopes

  validates :price, presence: true
  validates :title, presence: true
end
