require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end
    context "新規登録できるとき" do
      it "全ての情報が正しく入力されていたら登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが英数字混合なら登録できる" do
        @user.password = "s12222"
        @user.password_confirmation = "s12222"
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上なら登録できる" do
        @user.password = "111111a"
        @user.password_confirmation = "111111a"
        expect(@user).to be_valid
      end
      it "last_nameが全角なら登録できる" do
        @user.last_name = "本ほホ"
        expect(@user).to be_valid
      end
      it "first_nameが全角なら登録できる" do
        @user.first_name = "本ほホ"
        expect(@user).to be_valid
      end
      it "read_last_nameがカタカナなら登録できる" do
        @user.read_last_name = "タタタ"
        expect(@user).to be_valid
      end
      it "read_first_nameがカタカナなら登録できる" do
        @user.read_first_name = "ゴゴゴ"
        expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに@がない場合は登録できない" do
        @user.email = "hoge.hoge"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが５文字以下では登録できない" do
        @user.password = "11111"
        @user.password_confirmation = "11111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが英数字混ではないと登録できない" do
        @user.password = "222222"
        @user.password_confirmation = "222222"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "read_last_nameが空では登録できない" do
        @user.read_last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last name can't be blank")
      end
      it "read_first_nameが空では登録できない" do
        @user.read_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first name can't be blank")
      end
      it "last_nameが全角ではなければ登録できない" do
        @user.last_name = "dﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが全角ではなければ登録できない" do
        @user.first_name = "dﾀ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "read_last_nameがカタカナではなかったら登録できない" do
        @user.read_last_name = "あ青shi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read last name is invalid")
      end
      it "read_first_nameがカタカナではなかったら登録できない" do
        @user.read_first_name = "し火shi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Read first name is invalid")
      end
      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
