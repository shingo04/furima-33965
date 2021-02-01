require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入者情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context 'データの保存ができるとき' do
      it '全ての情報が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名を入力していなくても保存できる' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end
    context 'データの保存ができないとき' do
      it 'postal_codeが空の時保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに「-」が含まれていないと保存できない' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが全角だと保存できない' do
        @order_address.postal_code = '１１１ー１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが「3文字-4文字」じゃないと保存できない' do
        @order_address.postal_code = '1111-111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'delivery_source_idが空の時保存できない' do
        @order_address.delivery_source_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Delivery source can't be blank")
      end
      it 'delivery_source_idが0の時保存できない' do
        @order_address.delivery_source_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Delivery source must be other than 0')
      end
      it 'citiesが空の時保存できない' do
        @order_address.cities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Cities can't be blank")
      end
      it 'addressが空の時保存できない' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空の時保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上の時保存できない' do
        @order_address.phone_number = '111111111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'tokenが空の時保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
