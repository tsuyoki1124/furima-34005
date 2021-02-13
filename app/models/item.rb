class Item < ApplicationRecord
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :condition_id, numericality: { other_than: 0 }
  validates :category_id, numericality: { other_than: 0 }
  validates :delivery_fee_id, numericality: { other_than: 0 }
  validates :estimated_shipping_date_id, numericality: { other_than: 0 }
  validates :image, presence: true
  validates :title, presence: true
  validates :price, format: {with: /\A[0-9]+\z/, allow_blank: true }, numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
  validates :text, presence: true
  


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :estimated_shipping_date

  belongs_to :user
  has_one_attached :image

end
