module Concerns
  module AuthManagment
    def sign_in(user)
      session[:user_id] = user.id
    end

    def sign_out
      session[:user_id] = nil
    end

    def signed_in?
      !current_user.guest?
    end

    def signed_as_admin?
      current_user.admin?
    end

    def authenticate_admin!
      redirect_to new_session_path unless signed_as_admin?
    end

    def authenticate_user!
      redirect_to new_session_path unless signed_in?
    end

    def current_user
      @_current_user ||= User.where(id: session[:user_id]).first || Guest.new
    end
  end
end
