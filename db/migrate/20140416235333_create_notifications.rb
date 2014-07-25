class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
