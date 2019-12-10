class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :f_name_kanji, :string
    add_column :users, :l_name_kanji, :string
    add_column :users, :f_name_kana, :string 
    add_column :users, :l_name_kana, :string
    add_column :users, :birth_year, :integer
    add_column :users, :birth_month, :integer
    add_column :users, :birth_day, :integer
  end
end
