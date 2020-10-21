# テーブル設計

## users テーブル

| Column          | Type    | Options        |
| --------------- | ------- | -------------- |
| nickname        | string  | null: false    |
| email           | string  | null: false    |
| password        | string  | null: false    |
| last_name       | text    | null: false    |
| fist_name       | text    | null: false    |
| birthday        | text    | null: false    |

## Association
- has_many :purchase_record
- has_many :items


## items テーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| image           |            |                   |
| product_name    | text       | null: false       |
| category        | text       | null: false       |
| price           | text       | null: false       |
| seller          | text       | null: false       |
| user            | references | foreign_key: true |

## Association
- belongs_to:user
- has_many:


## purchase_record テーブル

| Column          | Type        | Options          |
| --------------- | ----------- | ---------------- |
| purchase_date   | text        | null: false      |
| user            | references  | foreign_key: true|
| items           | references  | foreign_key: true|


## Association
- belongs_to:user
- belongs_to:items


## shipping_address テーブル

| Column          | Type         | Options        |
| --------------- | ------------ | -------------- |
| postal_code     |   text       | null: false    |
| prefectures     |   text       | null: false    |
| municipality    |   text       | null: false    |
| address         |   text       | null: false    |
| building_name   |   text       | null: false    |
| phone_number    |   text       | null: false    |

## Association
 - belongs_to:purchase_record
 - 