## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,unique: true|
|password|string|null: false|
|email|string|null: false, unique: true|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|post_code|string|null: false|
|prefecture_code|string|null: false|
|city|string|null: false|
|house_number|string|null:false|
|building_name|string| -|
|phone_number|string|

### Association
- has_one :credit_card,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :favorites,dependent: :destroy
- has_many :seller_items,class:"items"
- has_many :buyer_items,class:"items"

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|string|null: false|
|item_introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|condition|string|null: false|
|item_imageas_id|references|null: false, foreign_key: true|
|postage_payers_id|references|null:false, foreign_key: true|
|preparation_period_id|references|null: false, foreign_key: true|
|deal_closed_data|string| -|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|


### Association
- has_many :item_images,dependent: :destroy
- has_many :comments,dependent: :destroy
- has_many :favorites,dependent: :destroy
- belongs_to :category
- belongs_to :brand
- belongs_to :postage_payer,dependent: :destroy
- belongs_to :preparation_period,dependent: :destroy
- belongs_to :seller_item,class_name:"User"
- belongs_to :buyer_item,class_name:"User"

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
belongs_to :user

## categoriesテーブル(gem:ancestry)
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string| -|

### Association
- has_many :items

## postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payers|string|null:false|

### Association
- has_many :items

## preparation_periodテーブル
|Column|Type|Options|
|------|----|-------|
|preparation_period|string|null:false|

### Association
- has_many :items

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null:false, foreign_key:true|
|url|string|null:false|

### Association
- belongs_to :item

## commentsテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## favoritesテーブル(中間テーブル)
|Column|Type|Options|
|------|----|-------|
|favorites|string|null:false|
|user_id|references|null:false, foreign_key: true|
|item_id|references|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

 