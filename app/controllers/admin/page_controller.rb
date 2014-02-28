class Admin::PageController < Admin::ApplicationController
  def new
    @page = Page.new
  end

  def edit
    @page = Page.find params[:id]
  end

  def create
    @page = Page.new params[:page]
    if @page.save
      flash_success
      redirect_to page_path(@page)
    else
      flash_error
      render :new
    end
  end

  def show
    @page = Page.find params[:id]
  end

  def index
    @pages = Page.order('created_at DESC').page(params[:page]).per(20)
  end

  def update
    @page = Page.find params[:id]
    if @page.update_attributes params[:page]
      flash_success
      redirect_to edit_admin_page_path(@page)
    else
      flash_error
      render :new
    end
  end

  def destroy
    @page = Page.find params[:id]
    @page.destroy
    redirect_to admin_page_index_path
  end
end
