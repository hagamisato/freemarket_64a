## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|f_name_kanji|string|null: false|
|l_name_kanji|string|null: false|
|f_name_kana|string|null: false|
|l_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|phone_number|string||
### Association
- has_many :commnets
- has_many :items, through: :user_items
- has_many :user_items
- has_one :address
- has_one :card
- accepts_nested_attributes_for :address
- has_many :sns_credentials, dependent: :destroy

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|string||
### Association
- belongs_to :users, optional: true

## cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user

## user_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|categorys_id|references|null: false, foreign_key: true|
|buyer|references||
|name|string|null: false|
|explain|text|null: false|
|bland|string||
|size|string|null: false|
|postage|string|null: false|
|delivery_way|string|null: false|
|shipping_area|string|null: false|
|shipping_date|string||
|price|integer|null: false|
### Association
- has_many :images
- has_many :categories
- has_many :user, through: :user_items
- has_many :user_items
- belongs_to :user
- accepts_nested_attributes_for :images
- accepts_nested_attributes_for :categories


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :item

## prefectureテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|references|null: false, foreign_key: true|
|name|string||
### Association


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string||
|item|references||
### Association
- has_many :items


