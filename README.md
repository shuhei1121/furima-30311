## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_ruby | string | null: false |
| last_name_ruby  | string | null: false |
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| text         | text       | null: false                    |
| category     | string     | null: false                    |
| status       | text       | null: false                    |
| delivery_fee | string     | null: false                    |
| prefecture   | string     | null: false                    |
| shipping_fee | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column | Type       | Options                                      |
| ------ | ---------- | -------------------------------------------- |
| user   | references | null: false, foreign_key: true               |
| item   | references | null: false, unique: true, foreign_key: true |

### Association

- belongs_to :item
- has_one :addresses

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| telephone_number | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase