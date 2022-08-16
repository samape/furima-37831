require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品ができる場合' do
      it '全ての値が問題なく入力されている場合' do
        expect(@item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it '商品画像がついていないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと保存できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end
      it 'カテゴリーが選択されていないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が選択されていないと保存できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it '配送料の負担が選択されていないと保存できない' do
        @item.del_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Del charge can't be blank")
      end
      it '発送元の地域が選択されていないと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送までの日数が選択されていないと保存できない' do
        @item.del_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Del day can't be blank")
      end
      it '価格が空だと保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が¥300未満の金額だと保存できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が¥9,999,999より大きい金額だと保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it '価格が全角数値だと保存できない' do
        @item.price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid')
      end
      it 'ユーザーが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
