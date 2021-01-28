require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end
    context "商品が出品できるとき" do
      it "全ての情報が正しく入力できている場合出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品が出品できないとき" do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空では出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explanationが空では出品できない" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "category_idが0では出品できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it "item_status_idが空では出品できない" do
        @item.item_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it "item_status_idが0では出品できない" do
        @item.item_status_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status must be other than 0")
      end
      it "delivery_fee_idが空では出品できない" do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "delivery_fee_idが0では出品できない" do
        @item.delivery_fee_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
      end
      it "delivery_source_idが空では出品できない" do
        @item.delivery_source_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source can't be blank")
      end
      it "delivery_source_idが0では出品できない" do
        @item.delivery_source_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery source must be other than 0")
      end
      it "delivery_date_idが空では出品できない" do
        @item.delivery_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it "delivery_date_idが0では出品できない" do
        @item.delivery_date_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date must be other than 0")
      end
      it "item_priceが空では出品できない" do
        @item.item_price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "item_priceが300円未満では出品できない" do
        @item.item_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it "item_priceが9999999円より多かったら出品できない" do
        @item.item_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it "item_priceが全角数字では出品できない" do
        @item.item_price = "１０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceが半角英数字では出品できない" do
        @item.item_price = "123asd"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceが半角英字では出品できない" do
        @item.item_price = "asdf"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
    end
  end
end
