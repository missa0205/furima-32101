require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    
  context '新規登録がうまくいくとき' do
    it "全ての項目の入力が存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが40文字以下で登録できる" do
      @user.nickname = "testtesttesttesttesttesttesttesttesttest"
      expect(@user).to be_valid
    end
    it "passwordが英数字を含め6文字以上であれば登録できる" do
      @user.password = "aaa000"
      @user.password_confirmation = "aaa000"
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "nicknameが40文字以上であれば登録できない" do
      @user.nickname = "testtesttesttesttesttesttesttesttesttesttest"
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 40 characters)")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "aaa00"
      @user.password_confirmation = "aaa00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")    end
    it "passwordが半角英数混合でなければ登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it "family_nameが空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "family_nameが全角入力でなければ登録できない" do
      @user.family_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "first_nameが全角入力でなければ登録できない" do
      @user.first_name = "ｱｲｳｴｵ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "family_name_kanaが空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "family_name_kanaがカナ以外だと登録できない" do
      @user.family_name_kana = "あああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "first_name_kanaがカナ以外だと登録できない" do
      @user.first_name_kana = "あああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "birthが空だと登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
