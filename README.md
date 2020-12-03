# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_name_kana   | string | null: false               |
| first_name_kana    | string | null: false               |
| birth      　　　   | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column            | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
| name       　　　  | string     | null: false                   |
| introduction      | text       | null: false                   |
| category_id       | integer    | null: false                   |
| item_condition_id | integer    | null: false                   |
| postage_payer_id  | integer    | null: false                   |
| shipping_area_id  | integer    | null: false                   |
| prefecture_id     | integer    | null: false                   |
| price             | integer    | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping_day


## shipping_address
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- has_one_active_hash :prefectures
- belongs_to :purchase


## purchase
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
