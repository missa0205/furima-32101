class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name,  length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than: 9_999_999 }, format: { with: /\A[0-9]+\Z/ }
    validates :user
  end
  
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_payer_id
    validates :prefecture_id
    validates :shipping_day_id
  end
  
end
