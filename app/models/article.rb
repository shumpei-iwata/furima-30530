class Article < ActiveHash::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category_id
  belongs_to_active_hash :states_id
  belongs_to_active_hash :delivery_charge_id
  belongs_to_active_hash :area_id
  belongs_to_active_hash :days_id
end
