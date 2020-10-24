require 'rails_helper'

RSpec.describe User, type: :model do
  # describe User　do
    before do
      @user = FactoryBot.build(:user)
    end

    describe'新規登録' do
      context '新規登録が上手く行くとき' do
        it "全ての情報がある時" do
        end
      end
    
      context '新規登録が上手くいかないとき' do
        it "nicknameが空だと登録できない" do
          @user.nickname = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空だと登録できない" do
          @user.email = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailが重複していると登録できない" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "passwordが空だと登録できない" do
          @user.password = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが5文字以下だと登録できない" do
          @user.password = "aaa11"
          @user.password_confirmation = "aaa11"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordが半角英語のみだと登録できない" do
          @user.password = 'aaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
        end
        it "passwordが存在してもpassword_comfirmationが空では登録できない" do
          @user.password_confirmation = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "last_nameが空だと登録できない" do
          @user.last_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end
        it "fist_nameが空だと登録できない" do
          @user.fist_name = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Fist name can't be blank")
        end
        it "last_name_kanaが空だと登録できない" do
          @user.last_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end
        it "fist_name_kanaが空だと登録できない" do
          @user.fist_name_kana = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Fist name kana can't be blank")
        end
        it "last_nameが全角の漢字、ひらがな以外だと登録できない" do
          @user.last_name = "ymada"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name please use double-byte characters")
        end
        it "fist_nameが全角の漢字、ひらがな以外だと登録できない" do
          @user.fist_name = "tarou"
          @user.valid?
          expect(@user.errors.full_messages).to include("Fist name please use double-byte characters")
        end
        it "last_name_kanaが半角だと登録できない" do
          @user.last_name_kana = "ﾔﾏﾀﾞ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana please use full-width katakana characters")
        end
        it "fist_name_kanaが半角だと登録できない" do
          @user.fist_name_kana = "ﾀﾛｳ"
          @user.valid?
          expect(@user.errors.full_messages).to include("Fist name kana please use full-width katakana characters")
        end
        it "birthdayが空だと登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
  # end
end