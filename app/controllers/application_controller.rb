class ApplicationController < ActionController::Base
  include AuthHelper
  include FlashHelper
  helper_method :sign_in, :sign_out, :signed_as_admin?
  
  protect_from_forgery
end
