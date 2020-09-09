require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.jpg')
  end
  describe '#create' do
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'imageとnameとintoroduceとcategoryとconditionとpostage_payerとprefecture_codeとpreparation_dayとpriceが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字まででないと出品できない' do
        @item.name = 'あ' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'introduceが空だと出品できない' do
        @item.introduce = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end
      it 'introduceが1000文字まででないと出品できない' do
        @item.introduce = 'あ' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include('Introduce is too long (maximum is 1000 characters)')
      end
      it 'categoryを選択してないと出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'conditionが選択してないと出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition Select')
      end
      it 'postage_payerが選択してないと出品できない' do
        @item.postage_payer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Postage payer Select')
      end
      it 'prefecture_codeが選択してないと出品できない' do
        @item.prefecture_code_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture code Select')
      end
      it 'preparation_dayが選択してないと出品できない' do
        @item.preparation_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Preparation day Select')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角でないと出品できない' do
        @item.price = '３０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
      end
      it 'priceが価格設定範囲内でないと出品きない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range, Half-width number')
      end
    end
  end
end
