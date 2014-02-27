class ApplicationController < ActionController::Base
  include AuthHelper
  include FlashHelper
  helper_method :sign_in, :sign_out, :signed_as_admin?, :pages_top_navbar, :pages_side_navtabs

  def pages_top_navbar
    Page.where(place_in_top_navbar: true)
  end

  def pages_side_navtabs
    Page.where(place_in_side_navtabs: true)    
  end
  
  protect_from_forgery
end
