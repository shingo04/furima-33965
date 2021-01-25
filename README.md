# README

# データベース設計

## usersテーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| email            | string  | null: false |
| password         | string  | null: false |
| nickname         | string  | null: false |
| last_name        | string  | null: false |
| first_name       | string  | null: false |
| read_first_name  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association
- has_many :items
- has_many :comments

## itemsテーブル

| Column          | Type       | Options                        |
| --------------  | -------    | ------------------------------ |
| item_image      |            | ActiveStorageで実装             |
| item_name       | text       | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| item_status     | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_source | string     | null: false                    |
| delivery_date   | string     | null: false                    |
| item_price      | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
