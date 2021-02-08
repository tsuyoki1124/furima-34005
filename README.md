# README

users table

| Column                | Type     | Options     | 
| --------------------- | -------- | ------------|
| nickname              | string   | null: false |
| email                 | string   | null: false |
| password              | string   | null: false |
| password_confirmation | string   | null: false |
| last_name_kanji       | string   | null: false |
| first_name_kanji      | string   | null: false |
| last_name_kana        | string   | null: false |
| first_name_kana       | string   | null: false |

Association
- has_many :items
- has_many :orders

items table

| Column                  | Type       | Options           | 
| ----------------------- | ---------- | ----------------- |
| price                   | integer    | null: false       |
| tittle                  | string     | null: false       |
| selling_user            | references | foreign_key: true |
| category                | string     | null: false       |
| condition               | string     | null: false       |
| delivery_fee            | string     | null: false       |
| shipping_address        | string     | null: false       |
| estimated_shipping_date | string     | null: false       |

Association
- belongs_to :user
- belongs_to :order

orders table

| column  | Type       | Options           |
| ------- | -----------| ----------------- |
| user_id | references | foreign_key: true |
| token   | references | foreign_key: true |

Association
- belongs_to :user
- belongs_to :item
- has_one :address

addresses table

| column       | Type       | Options           |
| ------------ | -----------| ----------------- |
| user_id      | references | foreign_key: true |
| postalcode   | integer    | null: false       |
| prefecture   | string     | null: false       |
| town         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     | null: false       |
| phone_number | integer    | null: false       |

Association
- belongs_to :order