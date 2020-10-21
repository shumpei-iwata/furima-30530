# テーブル設計

## users テーブル

| Column          | Type    | Options        |
| --------------- | ------- | -------------- |
| nickname        | string  | null: false    |
| email           | string  | null: false    |
| password        | string  | null: false    |
| last_name       | string  | null: false    |
| fist_name       | string  | null: false    |
| last_name_kana  | string  | null: false    |
| fist_name_kana  | string  | null: false    |
| birthday        | date    | null: false    |

## Association
- has_many :purchase_records
- has_many :items


## items テーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| product_name    | string     | null: false                  |
| category_id     | integer    | null: false                  |
| price           | integer    | null: false                  |
| description     | text       | null: false                  |
| delivery_charge | integer    | null: false                  |
| area            | integer    | null: false                  |
| days            | integer    | null: false                  |
| user_id         | integer    | foreign_key: true, null:false|

## Association
- belongs_to:user
- has_one:purchase_record
- 


## purchase_records テーブル

| Column             | Type        | Options                       |
| ---------------    | ----------- | ----------------------------- |
| user_id            | integer     | foreign_key: true, null: false|
| item_id            | integer     | foreign_key: true, null: false|


## Association
- belongs_to:user
- belongs_to:item
- has_one:shipping_address


## shipping_address テーブル

| Column             | Type         | Options                       |
| ------------------ | ------------ | ----------------------------- |
| postal_code        |   string     | null: false                   |
| prefecture_id      |    integer   | null: false                   |
| municipality       |   string     | null: false                   |
| address            |   string     | null: false                   |
| building_name      |   string     |                               |
| phone_number       |   string     | null: false                   |
| purchase_record_id | integer      | foreign_key: true, null: false|

## Association
 - belongs_to:purchase_record
 - 