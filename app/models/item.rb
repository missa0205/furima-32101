class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :introduction, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\Z/ }
  validates :user, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :postage_payer_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :shipping_day_id, numericality: { other_than: 1 }
end
