class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :title
      t.text :body
      t.boolean :place_in_top_navbar
      t.boolean :place_in_side_navtabs

      t.timestamps
    end
  end
end
