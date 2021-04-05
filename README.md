# テーブル設計

## users

|Column           |Type    |Options                     |
|-----------------|--------|----------------------------|
|nickname         |string  |null: false                 |
|email            |string  |null: false,unique: true    |
|password         |string  |null: false                 |
|last_name        |string  |null: false                 |
|first_name       |string  |null: false                 |
|last_name_kana   |string  |null: false                 |
|first_name_kana  |string  |null: false                 |
|birth_day        |integer |null: false                 |

### Association
has_many :items
has_many :purchase_record

## items

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|item_name        |string     |null: false       |
|item_text        |text       |null: false       |
|category         |string     |null: false       |
|product_status   |string     |null: false       |
|shipping_charges |string     |null: false       |
|shipping_area    |string     |null: false       |
|shipping_date    |string     |null: false       |
|price            |integer    |null: false       |
|image            |           |null: false       |
|user_id          |references |foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase_record

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|user_id          |references |foreign_key: true |
|item_id          |references |foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_address
|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|post_code        |string     |null: false       |
|prefectures      |string     |null: false       |
|city             |string     |null: false       |
|address          |string     |null: false       |
|building_name    |string     |null: false       |
|phone_number     |integer    |null: false       |
|shipping_address |references |foreign_key: true |

### Association
belongs_to :purchase_record
