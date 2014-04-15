class Admin::ApplicationController < ApplicationController
  before_filter :authenticate_admin! if !Rails.env.test?
end
