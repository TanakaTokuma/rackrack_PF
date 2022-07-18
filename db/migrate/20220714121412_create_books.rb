class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|

      t.integer :customer_id
      t.string :title
      t.string :author
      t.string :publisher
      t.string :saledate
      t.string :category
      t.text :caption
      t.boolean :read_st

      t.timestamps
    end
  end
end
