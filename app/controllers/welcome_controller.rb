class WelcomeController < ApplicationController
  def index
    @new_news = News.new
    @news = News.order('published_at DESC').page(params[:page]).per(5)
  end
end
