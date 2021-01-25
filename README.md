# README

# データベース設計

## usersテーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| email              | string  | null: false, unique:true |
| encrypted_password | string  | null: false              |
| nickname           | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| read_last_name     | string  | null: false              |
| read_first_name    | string  | null: false              |
| birth_date         | date    | null: false              |

### Association
- has_many :items
- has_many :comments
- has_many :buys

## itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| item_status_id     | integer    | null: false                    |
| delivery_fee_id    | integer    | null: false                    |
| delivery_source_id | integer    | null: false                    |
| delivery_date_id   | integer    | null: false                    |
| item_price         | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :comments
- has_many :buys

## buysテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| postal_code        | string     | null: false                    |
| delivery_source_id | integer    | null: false                    |
| cities             | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| buy                | references | null: false, foreign_key: true |

### Association
- belongs_to :buy

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
