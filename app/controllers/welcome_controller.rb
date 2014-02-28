class WelcomeController < ApplicationController
  def index
    @news = News.order('published_at DESC').first(5)
    @history = Page.where(slug: "history").first
  end
end
