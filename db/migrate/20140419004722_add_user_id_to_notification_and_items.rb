class AddUserIdToNotificationAndItems < ActiveRecord::Migration
  def change
    add_column :items, :user_id, :integer
    add_column :notifications, :user_id, :integer
    add_column :items, :for_all_users, :boolean
    add_column :notifications, :for_all_users, :boolean
  end
end
