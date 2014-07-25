class Admin::WelcomeController < Admin::ApplicationController
  def index
    @users_count = User.count
  end
end
