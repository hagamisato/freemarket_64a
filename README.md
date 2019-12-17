## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
|password|string|null: false|
|f_name_kanji|string|null: false|
|l_name_kanji|string|null: false|
|j_name_kana|string|null: false|
|l_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
### Association
- has_many :commnets
- has_many :items, through: :user_items
- has_many :user_items
- has_one :address
- has_one :credit_card

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building|string||
|phone_number|integer||
### Association
- belongs_to :users

## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_number|integer|null: false|
|year|integer|null: false|
|month|integer|null: false|
|security_number|integer|null: false|
### Association
- belongs_to :users

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|body|text|null: false|
### Association
- belongs_to :users
- belongs_to :item

## user_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|categorys_id|references|null: false, foreign_key: true|
|bland_id|references||
|postage|string|null: false|
|shipping_area|string|null: false|
|shipping_date|string||
|price|integer|null: false|
### Association
- has_many :images
- belongs_to :category
- has_many :comments
- has_many :user, through: :user_items
- has_many :user_items


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :item

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|categorys_id|references||
### Association

## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|type|string||
### Association
- has_many :items
- belongs_to :bland

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|type|string||
### Association
- has_many :categorys

