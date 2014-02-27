class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.where(login: params[:admin][:login]).first
    if @admin and @admin.authenticate(params[:admin][:password])
      sign_in @admin
      flash_success
      redirect_to admin_root_path, flash: :success
    else
      redirect_to new_session_path, flash: :error
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
