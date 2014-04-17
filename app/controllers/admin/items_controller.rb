class Admin::ItemsController < Admin::ApplicationController
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find params[:id]
  end

  def create
    @item = Item.new params[:item]
    if @item.save
      flash_success
      redirect_to admin_items_path
    else
      flash_error
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def update
    @item = Item.find params[:id]
    if @item.update_attributes params[:item]
      flash_success
      redirect_to admin_items_path
    else
      flash_error
      render :new
    end
  end

  def destroy
    @item = Item.find params[:id]
    @item.destroy
    redirect_to admin_items_path
  end
end
