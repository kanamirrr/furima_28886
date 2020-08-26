# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| birth_day             | date   | null: false |

### Association

- has_many :items
- has_one :purchases
- has_one :cards

## items テーブル

| Column          | type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| image           | string     | null:false                    |
| name            | string     | null:false                    |
| introduce       | text       | null:false                    |
| category        | integer    | null:false                    |
| condition       | integer    | null:false                    |
| postage_payer   | integer    | null:false                    |
| prefecture_code | integer    | null:false                    |
| preparation_day | integer    | null:false                    |
| price           | integer    | null:false                    |
| user_id         | references | null:false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :purchasers

##  perchasers テーブル

| Column          | type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| post_code       | integer    | null:false                    |
| prefecture_code | integer    | null:false                    |
| city            | string     | null:false                    |
| house_number    | string     | null:false                    |
| building_number | string     | null:false                    |
| user_id         | references | null:false, foreign_key: true |

### Association

- has_many :items
- belongs_to :users

## items_purchasers テーブル

| Column       | type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| item_id      | references | null:false, foreign_key: true |
| purchaser_id | references | null:false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :purchasers
