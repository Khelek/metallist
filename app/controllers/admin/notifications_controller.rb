class Admin::NotificationsController < ApplicationController
  def new
    @notification = Notification.new
  end

  def edit
    @notification = Notification.find params[:id]
  end

  def create
    @notification = Notification.new params[:notification]
    if @notification.save
      flash_success
      redirect_to admin_notifications_path
    else
      flash_error
      render :new
    end
  end

  def index
    @notifications = Notification.all
  end

  def update
    @notification = Notification.find params[:id]
    if @notification.update_attributes params[:notification]
      flash_success
      redirect_to edit_admin_notification_path @notification
    else
      flash_error
      render :new
    end
  end

  def destroy
    @notification = Notification.find params[:id]
    @notification.destroy
    redirect_to admin_notifications_path
  end
end
