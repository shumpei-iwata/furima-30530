class Item < ActiveHash::Base

   has_one_attached :image
   extend ActiveHash::Associations::ActiveRecordExtensions

   
end
