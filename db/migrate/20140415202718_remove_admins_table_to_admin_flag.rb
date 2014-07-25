class RemoveAdminsTableToAdminFlag < ActiveRecord::Migration
  def change
    drop_table :admins
    add_column :users, :admin, :boolean
  end
end
