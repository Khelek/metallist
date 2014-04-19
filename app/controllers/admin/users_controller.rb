class Admin::UsersController < Admin::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      flash_success
      redirect_to admin_users_path
    else
      flash_error
      render :new
    end
  end

  def index
    @users = User.all
  end

  def update
    @user = UserEditType.find params[:id]
    if @user.update_attributes params[:user]
      flash_success
      redirect_to admin_users_path
    else
      flash_error
      render :new
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end
end
