class PurchaseAddress < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :address, :building_name, :phone_number, :purchase_record_id
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id 
    validates :municipality
    validates :address 
    validates :building_name
    validates :phone_number
    validates :purchase_record_id
    end 
  

  def save

  end
end
