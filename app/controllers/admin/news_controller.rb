class Admin::NewsController < Admin::ApplicationController
  def new
    @news = News.new
  end

  def edit
    @news = News.find params[:id]
  end

  def create
    @news = News.new params[:news]
    if @news.save
      flash_success
      redirect_to news_path(@news)
    else
      flash_error
      render :new
    end
  end

  def index
    @news = News.order('published_at DESC').page(params[:page]).per(20)
  end

  def update
    @news = News.find params[:id]
    if @news.update_attributes params[:news]
      flash_success
      redirect_to news_path(@news)
    else
      flash_error
      render :new
    end
  end

  def destroy
    @news = News.find params[:id]
    @news.destroy
    redirect_to admin_news_index_path
  end
end
