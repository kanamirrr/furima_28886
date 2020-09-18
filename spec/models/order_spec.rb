require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @purchaser = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'tokenとpost_codeとprefecture_codeとcityとaddress1とphone_numberがあれば商品購入できること' do
        expect(@purchaser).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @purchaser.token = nil
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @purchaser.post_code = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeに-を含んでいないと購入できない' do
        @purchaser.post_code = '1234567'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include('Post code Input correctly')
      end
      it 'prefecture_codeが空だと購入できない' do
        @purchaser.prefecture_code_id = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Prefecture code can't be blank")
      end
      it 'cityが空だと購入できない' do
        @purchaser.city = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("City can't be blank")
      end
      it 'address1が空だと購入できない' do
        @purchaser.address1 = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Address1 can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchaser.phone_number = ''
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに-を含んでいると購入できない' do
        @purchaser.phone_number = '090-1234-5678'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @purchaser.phone_number = '090123456789'
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
