# DB 設計

## users table

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| ruby_first_name    | string | null: false               |
| ruby_last_name     | string | null: false               |
| birhtday           | date   | null: false               |

### Association

- has_many :purchases
- has_many :comments
- has_many :items

## purchases table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :address

### Association

- belongs_to :purchase

## comments table

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | string     | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association

- belong_to :user
- belong_to :item

## items table

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| text               | text       | null: false       |
| user               | references | foreign_key: true |
| price              | integer    | null: false       |
| category_id        | integer    | null: false       |
| state_id           | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| prefectures_id     | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |
| product_name       | string     | null: false       |

### Association

- belong_to :user
- has_one :purchase
- has_many :comments

## addresses table

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipality   | string     | null: false       |
| address        | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| purchase       | references | foreign_key: true |

### Association

- belong_to :purchase
