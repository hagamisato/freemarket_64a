class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :postage, null: false
      t.string :shipping_area,  null: false
      t.string :shipping_date	
      t.integer :price, null: false

      # 追加した分
      t.string :name, null: false
      t.text :explain, null: false
      t.string :state, null: false 
      t.references :buyer
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
