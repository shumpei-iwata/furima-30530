require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    
  end

 describe '配送情報保存' do
  context '配送情報保存が上手くいく時' do
    it 'postal_codeが存在していれば登録できる' do
      @order.postal_code = '123-4567'
      expect(@order).to be_valid
    end
    it 'area_idが存在していれば登録できる' do
      @order.area_id = 2
      expect(@order).to be_valid
    end
    it 'municipalityが存在していれば登録できる' do
      @order.municipality = '横浜市'
      expect(@order).to be_valid
    end
    it 'addressが存在していれば登録できる' do
      @order.address= '青山1-1'
      expect(@order).to be_valid
    end
    it 'building_nameは空でも登録できる' do
      @order.building_name = nil
      expect(@order).to be_valid
    end
    it 'phone_numberが存在していれば登録できる' do
      @order.phone_number= '09077776666'
      expect(@order).to be_valid
    end
  end 

  context '配送情報保存が上手くいかないとき' do
    it 'postal_codeが空だと登録できない' do
      @order.postal_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと登録できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'area_idが空だと登録できない' do
      @order.area_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと登録できない' do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと登録できない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと登録できない' do
      @order.phone_number = " "
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberのハイフンがあると登録できない' do
      @order.phone_number = '090-7777-6666'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number input only number")
    end
  end
 end
end