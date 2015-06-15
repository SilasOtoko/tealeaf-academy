class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :user
      t.text :post

      t.timestamps null: false
    end
  end
end
