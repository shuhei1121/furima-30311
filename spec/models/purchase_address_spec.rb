require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end
  describe '商品の購入' do
    context '商品の購入ができる場合' do
      it '必須項目を全て入力すれば購入できる' do
        expect(@purchase_address).to be_valid
      end
    end

    context '商品の購入ができない場合' do
      it 'tokenが空では購入できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空では購入できない' do
        @purchase_address.postal_code = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeにハイフンが無ければ購入できない' do
        @purchase_address.postal_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空では購入できない' do
        @purchase_address.prefecture_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが1(--)では出品できない' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空では購入できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @purchase_address.house_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'telephone_numberが空では購入できない' do
        @purchase_address.telephone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'telephone_numberにハイフンがあると購入できない' do
        @purchase_address.telephone_number = '123-4567-8901'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'telephone_numberに11桁以内で無ければ購入できない' do
        @purchase_address.telephone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'user_idが空では購入できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
