# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| password              | string | null: false |
| nickname              | string | null: false |
| email                 | string | null: false |
| birth_day             | date   | null: false |

### Association

- has_many :items
- has_many :purchaser_info

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

##  purchasers テーブル

| Column          | type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| post_code       | string     | null:false                    |
| prefecture_code | integer    | null:false                    |
| city            | string     | null:false                    |
| address1        | string     | null:false                    |
| address2        | string     |                               |
| item_purchaser  | references | null:false, foreign_key: true |

### Association

- belongs_to :purchaser_info
- belongs_to :item

## purchaser_info テーブル

| Column       | type       | Option                        |
| ------------ | ---------- | ----------------------------- |
| user         | references | null:false, foreign_key: true |
| item         | references | null:false, foreign_key: true |

### Association

- has_one :purchaser
- belongs_to :user