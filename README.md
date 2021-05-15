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

- has_many :purchase
- has_many :comments
- has_many :items
- has_one :pays

## purchase table

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user     | references | foreign_key: true |
| items_id | string     | foreign_key: true |

### Association

- belongs_to :users
- has_one :address

### Association

- belongs_to :purchase

## comments table

| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| text     | string     | null: false       |
| user     | references | foreign_key: true |
| items_id | string     | foreign_key: true |

### Association

- belong_to :users
- belong_to :items

## items table

| Column             | Type       | Options           |
| ------------------ | ---------- | ----------------- |
| text               | text       | null: false       |
| user               | references | foreign_key: true |
| price              | integer    | null: false       |
| category_id        | integer    | null: false       |
| state_id           | integer    | null: false       |
| shipping_charge_id | integer    | null: false       |
| shipping_area_id   | integer    | null: false       |
| shipping_date_id   | integer    | null: false       |
| product_name       | string     | null: false       |

### Association

- belong_to :users
- belong_to :purchase
- has_many :comments

## address table

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postal_code    | references | foreign_key: true |
| prefectures    | string     | foreign_key: true |
| municipalities | references | foreign_key: true |
| address        | string     | foreign_key: true |
| building_name  | references | foreign_key: true |
| phone_number   | string     | foreign_key: true |

### Association

- belong_to :purchase
