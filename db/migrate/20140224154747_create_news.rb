class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :body
      t.string :published_at
      t.string :title
      t.string :photo

      t.timestamps
    end
  end
end
