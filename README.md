# テーブル設計

## users

|Column             |Type    |Options                     |
|-------------------|--------|----------------------------|
|nickname           |string  |null: false                 |
|email              |string  |null: false,unique: true    |
|encrypted_password |string  |null: false                 |
|last_name          |string  |null: false                 |
|first_name         |string  |null: false                 |
|last_name_kana     |string  |null: false                 |
|first_name_kana    |string  |null: false                 |
|birth_day          |date    |null: false                 |

### Association
has_many :items
has_many :purchase_records

## items

|Column              |Type       |Options           |
|--------------------|-----------|------------------|
|item_name           |string     |null: false       |
|item_text           |text       |null: false       |
|category_id         |integer    |null: false       |
|product_status_id   |integer    |null: false       |
|shipping_charges_id |integer    |null: false       |
|prefectures_id      |integer    |null: false       |
|shipping_date_id    |integer    |null: false       |
|price               |integer    |null: false       |
|user                |references |foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase_record

|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|user             |references |foreign_key: true |
|item             |references |foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_address
|Column           |Type       |Options           |
|-----------------|-----------|------------------|
|post_code        |string     |null: false       |
|prefectures_id   |integer    |null: false       |
|city             |string     |null: false       |
|address          |string     |null: false       |
|building_name    |string     |                  |
|phone_number     |integer    |null: false       |
|purchase_record  |references |foreign_key: true |

### Association
belongs_to :purchase_record
