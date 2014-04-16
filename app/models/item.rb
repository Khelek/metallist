class Item < ActiveRecord::Base
  attr_accessible :price, :title

  validates :price, presence: true
  validates :title, presence: true
end
