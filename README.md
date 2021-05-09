# DB 設計

## users table

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| birhtday | integer | null: false |

### Association

- has_many :purchase
- has_many :comments
- has_many :items
- has_one :pays

## purchase table

| Column   | Type   | Options           |
| -------- | ------ | ----------------- |
| user_id  | string | foreign_key: true |
| items_id | string | foreign_key: true |

### Association

- belongs_to :users
- has_one :address

## address table

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| user_id      | string | null: false |
| address      | string | null: false |
| phone_number | string | null: false |

### Association

- belongs_to :purchase

## comments table

| Column   | Type   | Options           |
| -------- | ------ | ----------------- |
| text     | string | null: false       |
| user_id  | string | foreign_key: true |
| items_id | string | foreign_key: true |

### Association

- belong_to :users
- belong_to :items

## items table

| Column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| image            | string  | null: false       |
| text             | text    | null: false       |
| user_id          | string  | foreign_key: true |
| price            | string  | null: false       |
| category         | integer | foreign_key: true |
| states           | integer | foreign_key: true |
| shipping_charges | integer | null: false       |
| shipping_area    | integer | foreign_key: true |
| shipping_date    | integer | foreign_key: true |

### Association

- belong_to :users
- belong_to :purchase
- has_many :comments

## pays table

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| user_id         | string  | foreign_key: true |
| card_number     | string  | null: false       |
| security_number | string  | null: false       |
| expiration      | integer | null: false       |

### Association

- belong_to users
