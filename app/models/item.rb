class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :states
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :day
  belongs_to_active_hash :area

  validates :image,       presence: true
  validates :product_name, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :states_id,   presence: true
  validates :delivery_charge_id, presence: true
  validates :area_id,     presence: true
  validates :day_id,       presence: true
  validates :category_id, :states_id, :day_id, :area_id, :delivery_charge_id, numericality: { other_than: 1 }
  

  with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/,message: 'please type using half-width characters' } do
  validates :price,       presence: true
  end
  belongs_to :user
end
