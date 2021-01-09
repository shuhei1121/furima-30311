class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day
  has_one_attached :image

  validates :name, :text, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price,
            :image, presence: true

  validates :category_id, :status_id, :delivery_fee_id, :prefecture_id, :shipping_day_id,
            numericality: { other_than: 1 }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
