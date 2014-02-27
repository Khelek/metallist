class NewsController < ApplicationController
  def create
    @news = News.new params[:news]
    if @news.save
      redirect_to root_path, flash: :success
    else
      render action: :new, flash: :error
    end
  end

  def index
    @news = News.order('published_at DESC').page(params[:page]).per(5)
  end

  def show
    @news = News.find params[:id]
  end
end
