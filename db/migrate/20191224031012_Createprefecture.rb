class CreatePrefecture < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :prefecture

      t.timestamps
    end
  end
end
