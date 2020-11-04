require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
    
  end

 describe '商品購入' do
  context '商品購入が上手くいく時' do
    it "tokenがあれば保存ができること" do
      expect(@order).to be_valid
    end
    it 'postal_codeが存在していれば購入できる' do
      @order.postal_code = '123-4567'
      expect(@order).to be_valid
    end
    it 'area_idが存在していれば購入できる' do
      @order.area_id = 2
      expect(@order).to be_valid
    end
    it 'municipalityが存在していれば購入できる' do
      @order.municipality = '横浜市'
      expect(@order).to be_valid
    end
    it 'addressが存在していれば購入できる' do
      @order.address= '青山1-1'
      expect(@order).to be_valid
    end
    it 'building_nameは空でも購入できる' do
      @order.building_name = nil
      expect(@order).to be_valid
    end
    it 'phone_numberが存在していれば購入できる' do
      @order.phone_number= '09077776666'
      expect(@order).to be_valid
    end
  end 

  context '商品購入が上手くいかないとき' do
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと購入できない' do
      @order.postal_code = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeにハイフンがないと購入できない' do
      @order.postal_code = '1234567'
      @order.valid?
      expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'area_idが空だと購入できない' do
      @order.area_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end
    it 'municipalityが空だと購入できない' do
      @order.municipality = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'addressが空だと購入できない' do
      @order.address = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空だと購入できない' do
      @order.phone_number = " "
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberのハイフンがあると購入できない' do
      @order.phone_number = '090-7777-6666'
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number input only number")
    end
  end
 end
end