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

| Column           | Type   | Options                  |
| ---------------- | ------ | ------------------------ |
| nickname         | string | null: false              |
| email            | string | null: false, unique: true|
| password         | string | null: false              |
| family_name      | string | null: false              |
| first_name       | string | null: false              |
| family_name_kana | string | null: false              |
| first_name_kana  | string | null: false              |
| birth_year       | date   | null: false              |
| birth_month      | date   | null: false              |
| birth_day        | date   | null: false              |

### Association
| has_many :items     |
| has_many :purchases |

## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_img          | string  | null: false |
| item_name         | string  | null: false |
| introduction      | text    | null: false |
| price             | integer | null: false |

### Association
| has_one :category_id       |
| has_one :item_condition_id |
| has_one :postage_payer_id  |
| has_one :shipping_area_id  |
| has_one :shipping_day_id   |
| belongs_to :user_id        |


## shipping_address
| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| zipcode       | integer(7) | null: false |
| city          | string     | null: false |
| state         | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | integer    | null: false |

### Association
| has_one :user_id |
| has_one :item_id |


## purchase
| Column        | Type     | Options     |
| ------------- | -------- | ----------- |
| purchase_date | date     | null: false |
| purchase_time | datetime | null: false |

### Association
| belongs_to :user_id |
| has_one :item_id    |


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
