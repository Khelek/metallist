class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.text :body
      t.date :published_at
      t.string :title
      t.text :photo
      
      t.timestamps
    end
  end
end
