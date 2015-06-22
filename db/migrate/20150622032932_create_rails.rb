class CreateRails < ActiveRecord::Migration
  def change
    create_table :rails do |t|
      t.string :g
      t.string :scaffold
      t.string :product
      t.string :name
      t.float :length
      t.float :width
      t.float :height
      t.float :weight

      t.timestamps null: false
    end
  end
end
