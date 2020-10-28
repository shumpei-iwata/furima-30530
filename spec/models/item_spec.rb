require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品が上手く行くとき' do
      it 'product_nameがある時出品できる' do
        @item.product_name = 'aアあ亜1'
        expect(@item).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'product_nameがない時出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'descriptionがない時出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'imageがない時出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'category_idがない時出品できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it 'area_idがない時出品できない' do
        @item.area_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end

      it 'states_idがない時出品できない' do
        @item.states_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('States is not a number')
      end

      it 'day_idがない時出品できない' do
        @item.day_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Day is not a number')
      end

      it 'delivery_charge_idがない時出品できない' do
        @item.delivery_charge_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge is not a number')
      end

      it 'priceがない時出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
