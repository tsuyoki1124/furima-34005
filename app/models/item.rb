class Item < ApplicationRecord
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :category_id, numericality: { other_than: 0 }
  validates :delivery_fee_id, numericality: { other_than: 0 }
  validates :estimated_shipping_date_id, numericality: { other_than: 0 }

  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :estimated_shipping_date

end
