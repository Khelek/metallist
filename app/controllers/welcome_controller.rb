class WelcomeController < ApplicationController
  def index
    @news = News.order('published_at DESC').page(params[:page]).per(5)
  end
end
