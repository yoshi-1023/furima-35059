require 'rails_helper'

RSpec.describe OrderShipping, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入ページ' do
    context '商品の購入記録がされた時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end

      it 'ビル名がなくても保存できること' do
        @order_shipping.building_name = ''
        expect(@order_shipping).to be_valid
      end

      it 'phone_numberが10桁でも保存できること' do
        @order_shipping.phone_number = '0901234567'
        expect(@order_shipping).to be_valid
      end
    end

    context '商品の購入記録がされない時' do
      it 'tokenがないと保存できないこと' do
        @order_shipping.token = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Token can't be blank")
      end

      it 'post_codeが空だと保存できないこと' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeにハイフンがないと保存できない' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Post code Input correctly")
      end

      it 'prefecturesが未設定だと保存できないこと' do
        @order_shipping.prefectures_id = 1
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Prefectures Select")
      end

      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @order_shipping.address = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが数値以外があると保存できないこと' do
        @order_shipping.phone_number = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが英数字だと保存できないこと' do
        @order_shipping.phone_number = 'abc12345678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが11桁より多いと保存できないこと' do
        @order_shipping.phone_number = '090123456789'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end

      it 'phone_numberが10桁より少ないと保存できないこと' do
        @order_shipping.phone_number = '090123456'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include("Phone number Input only number")
      end

    end
  end
end
