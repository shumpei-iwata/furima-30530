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

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| product_name    | text       | null: false       |
| category        | text       | null: false       |
| price           | text       | null: false       |
| seller          | text       | null: false       |
| description     | text       | null: false       |
| delivery_charge | text       | null: false       |
| area            | text       | null: false       |
| days            | text       | null: false       |
| user            | references | foreign_key: true |

## Association
- belongs_to:user
- has_many:purchase_records
- 


## purchase_records テーブル

| Column          | Type        | Options          |
| --------------- | ----------- | ---------------- |
| user            | references  | foreign_key: true|
| item            | references  | foreign_key: true|


## Association
- belongs_to:user
- belongs_to:item
- has_one:shipping_address


## shipping_address テーブル

| Column          | Type         | Options          |
| --------------- | ------------ | ---------------- |
| postal_code     |   text       | null: false      |
| prefectures     |  integer     | null: false      |
| municipality    |   string     | null: false      |
| address         |   string     | null: false      |
| building_name   |   string     | null: false      |
| phone_number    |   text       | null: false      |
| purchase_record | references   | foreign_key: true|

## Association
 - has_one:purchase_record
 - 