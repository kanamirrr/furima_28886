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
- has_one :purchase

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
| user            | references | null:false, foreign_key: true |

### Association

- has_one :purchaser
- belongs_to :user
- belongs_to :purchaser

##  purchasers テーブル

| Column          | type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| post_code       | string     | null:false                    |
| prefecture_code | integer    | null:false                    |
| city            | string     | null:false                    |
| house_number    | string     | null:false                    |
| building_number | string     | null:false                    |
| user            | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :item_purchaser

## items_purchasers テーブル

| Column       | type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| item         | references | null:false, foreign_key: true |
| purchaser    | references | null:false, foreign_key: true |

### Association

- has_one :users
- has_one :items_purchasers
- belongs_to :item
- belongs_to :purchaser
