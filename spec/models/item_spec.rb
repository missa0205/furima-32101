require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品が正しく出品できるとき' do
      it '全ての項目の入力が存在していれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '出品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が入力されていないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が入力されていないと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end

      it '商品のカテゴリーが入っていないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end

      it '商品のカテゴリーにid:1が選択されていると出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品の状態が入っていないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition is not a number')
      end

      it '商品の状態にid:1が選択されていると出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end

      it '配送料の負担が入っていないと出品できない' do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer is not a number')
      end

      it '配送料の負担にid:1が選択されていると出品できない' do
        @item.postage_payer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer must be other than 1')
      end

      it '発送元の地域が入っていないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end

      it '発送元の地域にid:1が選択されていると出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it '発送までの日数が入っていないと出品できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day is not a number')
      end

      it '発送までの日数にid:1が選択されていると出品できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day must be other than 1')
      end

      it '販売価格が入っていないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300以上でなければ出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '販売価格が¥9999999以下でなければ出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end

      it '販売価格が半角数字でなければ出品できない' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
