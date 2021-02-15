class Item < ApplicationRecord
  with_options presence: true, numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :condition_id
    validates :category_id
    validates :delivery_fee_id
    validates :estimated_shipping_date_id
  end

  with_options presence: true do
    validates :image
    validates :text
    validates :title
  end

  validates :price, format: { with: /\A[0-9]+\z/, allow_blank: true },
                    numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :estimated_shipping_date

  belongs_to :user
  has_one_attached :image
end
