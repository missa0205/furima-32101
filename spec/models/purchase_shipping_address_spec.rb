require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end

  context "登録成功時" do
    it '全ての値が正しく入力されていれば保存ができること' do
      expect(@purchase_shipping_address).to be_valid
    end
  end
  
  context "エラー発生時" do
    it 'postal_codeが空では保存ができないこと' do
      @purchase_shipping_address.postal_code = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeはハイフンが必須なこと' do
      @purchase_shipping_address.postal_code = 1_111_111
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'prefecture_idが空では保存ができないこと' do
      @purchase_shipping_address.prefecture_id = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it 'prefecture_idが0だと保存できないこと' do
      @purchase_shipping_address.prefecture_id = 0
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
    end
  
    it 'cityが空では保存ができないこと' do
      @purchase_shipping_address.city = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
    end
  
    it 'house_numberが空では保存できないこと' do
      @purchase_shipping_address.house_number = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("House number can't be blank")
    end
  
    it 'phone_numberが空では保存できないこと' do
      @purchase_shipping_address.phone_number = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
    end
  
    it 'phone_numberが11桁以内でないと保存できないこと' do
      @purchase_shipping_address.phone_number = '090111111112'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid.")
    end
    
    it "phone_numberは英字混合では登録できないこと" do
      @purchase_shipping_address.phone_number = '090111111a1'
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid.")
    end

    it 'user_idが空では保存できないこと' do
      @purchase_shipping_address.user_id = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
    end
  
    it 'item_idが空では保存できないこと' do
      @purchase_shipping_address.item_id = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
    end
  
    it 'tokenが空では保存できないこと' do
      @purchase_shipping_address.token = nil
      @purchase_shipping_address.valid?
      expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
    end
  end
  
end
