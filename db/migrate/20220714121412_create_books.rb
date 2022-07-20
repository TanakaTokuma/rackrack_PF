class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.integer :customer_id
      t.string :image_url
      t.string :rakuten_url
      t.string :title
      t.string :author
      t.string :publisher
      t.string :saledate
      t.string :category
      t.float :rate
      t.text :caption
      t.boolean :read_st

      t.timestamps
    end
  end
end
