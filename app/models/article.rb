class Article < ActiveHash::Base
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
end
