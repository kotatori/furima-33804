require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationとlast_nameとfirst_nameとlast_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる。' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスは、@を含む必要があること' do
        @user.email = 'testcom'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '000aa'
        @user.password_confirmation = '000aa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Password Include both letters and numbers')
      end
      it 'passwordが全角のみだと登録できない' do
        @user.password = 'あああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end

      it 'passwordが半角数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
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
      it 'ユーザーlast_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name Last name First nam Full-width characters")
      end
      it 'ユーザーfirst_nameは、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name Last name First nam Full-width characters")
      end
      it 'rudy_last_nameが空では登録できない' do
        @user.rudy_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rudy last name can't be blank")
      end
      it 'rudy_first_nameが空では登録できない' do
        @user.rudy_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Rudy first name can't be blank")
      end

      it 'rudy_last_nameのフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.rudy_last_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rudy last name Last name kana First name kana Full-width katakana characters")
      end
      it 'rudy_first_nameのフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.rudy_first_name = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Rudy first name Last name kana First name kana Full-width katakana characters")
      end

      it 'rudy_last_nameはカタカナ以外の全角文字だと登録できないこと' do
        @user.rudy_last_name = "あ阿"
        @user.valid?
        expect(@user.errors[:rudy_last_name]).to include("Last name kana First name kana Full-width katakana characters")
      end

      it 'rudy_first_nameはカタカナ以外の全角文字だと登録できないこと' do
        @user.rudy_first_name = "あ阿"
        @user.valid?
        expect(@user.errors[:rudy_first_name]).to include("Last name kana First name kana Full-width katakana characters")
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
