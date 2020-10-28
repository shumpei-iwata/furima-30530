class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :states
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :day
  belongs_to_active_hash :area

  with_options presence: true do
  validates :image
  validates :product_name 
  validates :category_id 
  validates :description 
  validates :states_id
  validates :delivery_charge_id 
  validates :area_id 
  validates :day_id
  end 

  with_options numericality: { other_than: 1 } do
  validates :category_id 
  validates :states_id
  validates :delivery_charge_id 
  validates :area_id 
  validates :day_id
  end

  with_options presence: true do
    validates :price, numericality: { with: /\A[0-9]+\z/ , greater_than: 299, less_than:10000000, message: "Out of setting range"}
    
  end
  belongs_to :user
end
