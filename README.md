# README

users table

| Column                | Type     | Options                   | 
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |
| last_name             | string   | null: false               |
| first_name            | string   | null: false               |
| last_name_kana        | string   | null: false               |
| first_name_kana       | string   | null: false               |
| birthday              | date     | null: false               |

Association
- has_many :items
- has_many :orders

items table

| Column                     | Type       | Options           | 
| -------------------------- | ---------- | ----------------- |
| price                      | integer    | null: false       |
| title                     | string     | null: false       |
| text                       | text       | null: false       |
| user                       | references | foreign_key: true |
| category_id                | integer    | null: false       |  #active hashを使用するため末尾に_id、integer型
| condition_id               | integer    | null: false       |
| delivery_fee_id            | integer    | null: false       |
| prefecture_id              | integer    | null: false       |
| estimated_shipping_date_id | integer    | null: false       |

Association
- belongs_to :user
- has_one :order

orders table

| column  | Type       | Options           |
| ------- | -----------| ----------------- |
| user    | references | foreign_key: true | #users tableを参照する
| item    | references | foreign_key: true | #items tableを参照する

Association
- belongs_to :user
- belongs_to :item
- has_one :address

addresses table

| column        | Type       | Options           |
| ------------- | -----------| ----------------- |
| order         | refernces  | foreign_key: true | 　#orders tableを参照
| postalcode    | string     | null: false       |  #0から始まるとintegerでは補完できない
| prefecture_id | integer    | null: false       |
| town          | string     | null: false       |
| address       | string     | null: false       |
| building      | string     |                   |  #任意なので制約はいらない
| phone_number  | string     | null: false       |  #0から始まるとintegerでは補完できない

Association
- belongs_to :order