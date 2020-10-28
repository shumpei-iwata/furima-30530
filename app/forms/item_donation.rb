class ItemDonation

  include ActiveModel::Model
  attr_accessor :image, :area_id, :day_id, :category_id, :delivery_charge_id, :states_id, :product_name, :description, :price
 
  validates :image,       presence: true
  validates :product_name, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :states_id,   presence: true
  validates :delivery_charge_id, presence: true
  validates :area_id,     presence: true
  validates :day_id,       presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :states_id, numericality: { other_than: 1 }

  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/,message: 'Please type using half-width characters.' } do
  validates :price,       presence: true
  end
end