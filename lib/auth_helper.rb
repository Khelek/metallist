module AuthHelper
  def sign_in(admin)
    session[:admin_login] = admin.login
  end

  def sign_out(admin)
    session[:admin_login] = nil
  end

  def signed_as_admin?
    session[:admin_login] && Admin.where(login: session[:admin_login]).first
  end

  def authenticate_admin!
    redirect_to new_session_path unless signed_as_admin?
  end

end
