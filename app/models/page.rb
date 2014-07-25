class Page < ActiveRecord::Base
  attr_accessible :slug, :body, :place_in_top_navbar, :place_in_side_navtabs, :title

  validates :slug, presence: true
  validates :body, presence: true
  validates :title, presence: true
end
