# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def new
    @user = UserRegistrationType.new
  end
  
  def create
    @user = UserRegistrationType.new params[:user]
    @user.activate
    if @user.save
      flash_success
      redirect_to new_session_path
    else
      flash_error
      render action: "new"
    end
  end
end
