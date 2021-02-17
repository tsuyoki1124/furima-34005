class OrderAddress
  include ActiveModel::Model
  attr_accessor :postalcode, :prefecture_id, :town, :address, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postalcode, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid.", allow_blank: true}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :town, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid.", allow_blank: true}
    validates :address
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
    validates :user_id

  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postalcode: postalcode, prefecture_id: prefecture_id, town: town, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
  
end