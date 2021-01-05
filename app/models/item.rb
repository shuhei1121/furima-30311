class Item < ApplicationRecord

  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :
  validates :categpry_id, :status_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1 } 
end
