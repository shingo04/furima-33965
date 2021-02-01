class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_source_id, :cities, :address, :building_name, :phone_number, :order_id, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :delivery_source_id, numericality: { other_than: 0 }
    validates :cities
    validates :address
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_source_id: delivery_source_id, cities: cities, address: address,
                   building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
