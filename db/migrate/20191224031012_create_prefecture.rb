class CreatePrefecture < ActiveRecord::Migration[5.2]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.references :prefecture

      t.timestamps
    end
  end
end
