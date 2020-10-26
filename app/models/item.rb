class Item < ActiveHash::Base
   extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to_active_hash :category
   belongs_to_active_hash :states
   belongs_to_active_hash :delivery_charge
   belongs_to_active_hash :day
   belongs_to_active_hash :area

    validates :product_name, presence: true
    validates :category_id, presence: true
    validates :description, presence: true
    validates :states_id,   presence: true
    varidates :delivery_charge_id, presence: true
    varidates :area_id,     presence: true
    varidates :day_id,       presence: true
    validates :category_id, numericality: { other_than: 1 }
    validates :states_id, numericality: { other_than: 1 }

    with_options presence: true, format: { with: /\A[-]?[0-9]+(\.[0-9]+)?\z/,message: '' } do
    validates :price,       presence: true
    end

  belongs_to :user
end
