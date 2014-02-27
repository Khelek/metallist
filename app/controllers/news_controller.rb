class NewsController < ApplicationController
  def index
    @news = News.order('published_at DESC').page(params[:page]).per(5)
  end

  def show
    @news = News.find params[:id]
  end
end
