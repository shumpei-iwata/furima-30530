class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :token
  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id
    validates :municipality
    validates :address
    validates :phone_number, format: { with: /\d{11}\z/, message: 'input only number' }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end
