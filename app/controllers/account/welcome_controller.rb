class Account::WelcomeController < Account::ApplicationController
  def index
    @items = Item.with(user_id: current_user).last(10) + Item.with(for_all_users: true)
    @notifications = Notification.with(user_id: current_user).last(10) + Notification.with(for_all_users: true)
  end
end
