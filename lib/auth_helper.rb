# -*- coding: utf-8 -*-
module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
    track_user user
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    current_user
  end

  def signed_as_admin?
    signed_in? && current_user.admin?
  end

  def authenticate_user!
    unless signed_in?
      redirect_to new_session_path(from: request.url)
    end
  end

  def authenticate_admin!
    redirect_to new_session_path unless signed_as_admin?
  end

  def current_user
    session ||= request.session
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user == configus.basic_auth.username && password == configus.basic_auth.password
    end
  end

  def track_user(user)
    user.save(validate: false)
  end

  def deny_banned_user!
    if signed_in? && current_user.inactive?
      sign_out
      redirect_to banned_path
    end
  end

end
