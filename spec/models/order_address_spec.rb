require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)

    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/item-sample.png')
    @item.save

    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  context '保存できるとき' do
    it '全ての値が正常に入力されているとき保存できる' do
      expect(@order_address).to be_valid
    end

    it 'buildingが空でも保存できる' do
      @order_address.building = ''
      expect(@order_address).to be_valid
    end
  end

  context '保存できないとき' do
    it 'tokenが空だと保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'prefecture_idが0だと保存できない' do
      @order_address.prefecture_id = '0'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it 'prefecture_idが空だと保存できない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'townが空だと保存できない' do
      @order_address.town = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Town can't be blank")
    end

    it 'addressが空だと保存できない' do
      @order_address.address = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'user_idが空だと保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと登録できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it 'phone_numberは11桁以内でないと登録できないこと' do
      @order_address.phone_number = '111111111111111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberはハイフンが含まれていると登録できないこと' do
      @order_address.phone_number = '090-1111-1111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'phone_numberは英数字混合では登録できないこと' do
      @order_address.phone_number = '0a111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'postalcodeにはハイフンが含まれていないと登録できないこと' do
      @order_address.postalcode = '1111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postalcode is invalid. must include hyphen.')
    end
  end
end
