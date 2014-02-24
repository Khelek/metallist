class News < ActiveRecord::Base
  attr_accessible :body, :photo, :published_at, :title
end
