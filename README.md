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
| text                    | text       | null: false       |
| user                    | references |                   |
| category                | integer    | null: false       |  #active hashを使用するため、integer
| condition               | integer    | null: false       |
| delivery_fee            | integer    | null: false       |
| prefecture              | integer    | null: false       |
| estimated_shipping_date | integer    | null: false       |

Association
- belongs_to :user
- has_one :order

orders table

| column  | Type       | Options           |
| ------- | -----------| ----------------- |
| user    | references |                   | #users tableを参照する
| item    | references |                   | #items tableを参照する

Association
- belongs_to :user
- belongs_to :item
- has_one :address

addresses table

| column       | Type       | Options           |
| ------------ | -----------| ----------------- |
| user         | references |                   |
| postalcode   | string     | null: false       |  #0から始まるとintegerでは補完できない
| prefecture   | integer    | null: false       |
| town         | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |  #任意なので制約はいらない
| phone_number | string     | null: false       |  #0から始まるとintegerでは補完できない

Association
- belongs_to :order