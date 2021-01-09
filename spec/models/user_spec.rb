require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる場合' do
      it '必須項目を全て入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailが＠を含まない場合登録できない' do
        @user.email = 'test.email'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが6文字以上の場合登録できる' do
        @user.password = 'test12'
        @user.password_confirmation = 'test12'
        expect(@user).to be_valid
      end

      it 'passwordが5文字以下の場合登録できない' do
        @user.password = 'test1'
        @user.password_confirmation = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが不一致の場合登録できない' do
        @user.password = 'test123'
        @user.password_confirmation = 'test1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英数字混合でない場合登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid', 'Password confirmation is invalid')
      end

      it 'first_nameが空では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end

      it 'first_nameが全角でない場合登録できない' do
        @user.first_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank", 'Last name is invalid')
      end

      it 'last_nameが全角でない場合登録できない' do
        @user.last_name = 'ﾃｽﾄ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name_rubyが空では登録できない' do
        @user.first_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank", 'First name ruby is invalid')
      end

      it 'first_name_rubyが全角カタカナでない場合登録できない' do
        @user.first_name_ruby = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name ruby is invalid')
      end

      it 'last_name_rubyが空では登録できない' do
        @user.last_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name ruby can't be blank", 'Last name ruby is invalid')
      end

      it 'last_name_rubyが全角カタカナでない場合登録できない' do
        @user.last_name_ruby = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name ruby is invalid')
      end

      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
