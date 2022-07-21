# README

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| email              | string | null: false, unique: true |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| content     | text       | null: false                    |
| category    | integer    | null: false                    |
| status      | integer    | null: false                    |
| del_charge  | integer    | null: false                    |
| del_source  | integer    | null: false                    |
| del_days    | integer    | null: false                    |
| price       | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :del_charge
- belongs_to_active_hash :del_days

## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| post_code  | string     | null: false                    |
| prefecture | integer    | null: false                    |
| city       | string     | null: false                    |
| address    | string     | null: false                    |
| building   | string     |                                |
| phone_num  | string     | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture

## category
### Association

- has_many :items

## status
### Association

- has_many :items

## del_charge
### Association

- has_many :items

## del_days
### Association

- has_many :items

## prefecture
### Association

- has_many :addresses
- has_many :items