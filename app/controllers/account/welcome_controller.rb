class Account::WelcomeController < Account::ApplicationController
  def index
    @items = Item.all
    @notifications = Notification.last 10
  end
end
