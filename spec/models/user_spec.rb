require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
    it '全てが正しい値が入力されていれば登録できる' do
      expect(@user).to be_valid
    end
  end

    context 'ユーザー新規登録ができない時' do
    #空では登録できないテスト,null: false
    it 'nicknameが空では新規登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it 'emailに一意性がないと登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'passwordがからでは登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    #passwordのテスト
    it 'passwordが５文字以下だと登録できない' do
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが英字のみだと登録できない' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが数字のみだと登録できない' do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが全角だと登録できない' do
      @user.password = 'ＦＦＦ１１１'
      @user.password_confirmation = 'ＦＦＦ１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordとpassword_confirmationが一致しないと登録できない' do
      @user.password = 'aaa111'
      @user.password_confirmation = '111aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    #名前のテスト
    it 'last_nameは半角だと登録できない' do
      @user.last_name = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'last_nameは数字では登録できない' do
      @user.last_name = '１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end


    it 'first_nameは半角だと登録できない' do
      @user.first_name = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'first_nameは数字では登録できない' do
      @user.first_name = '１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaは半角だと登録できない' do
      @user.last_name_kana = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'last_name_kanaは数字では登録できない' do
      @user.last_name_kana = '１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end


    it 'first_name_kanaは半角だと登録できない' do
      @user.first_name_kana = 'ｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'first_name_kanaは数字では登録できない' do
      @user.first_name_kana = '１１１'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

end
end
end