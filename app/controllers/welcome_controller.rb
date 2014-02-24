class WelcomeController < ApplicationController
  def index
    @new_news = News.new
    @news = News.all
  end
end
