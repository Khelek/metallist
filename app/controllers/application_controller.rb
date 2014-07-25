class ApplicationController < ActionController::Base
  include Concerns::AuthManagment
  include FlashHelper
  helper_method :current_user, :signed_in?, :signed_as_admin?
  
  protect_from_forgery
end
