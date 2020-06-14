class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :category_id
      t.integer :comment_id
      t.integer :like_id
      t.string :title, null: false
      t.string :post_image_id, null: false
      t.string :shop_name, null: false
      t.string :post_status
      t.timestamps
    end
  end
end
