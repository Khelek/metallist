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
    @news = News.all #FIXME paginate add
  end

  def show
    @news = News.find params[:id]
  end
end
