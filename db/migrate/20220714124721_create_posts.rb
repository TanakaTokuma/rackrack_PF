class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.integer :customer_id
      t.integer :book_id
      t.float :rate
      t.text :comment

      t.timestamps
    end
  end
end
