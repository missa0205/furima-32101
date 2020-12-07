require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "たろう", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "たろう", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "たろう", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "family_nameが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "", first_name: "太郎", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "first_nameが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "family_name_kanaが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "太郎", family_name_kana: "", first_name_kana: "タロウ", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "first_name_kanaが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "太郎", family_name_kana: "テスト", first_name_kana: "", birth: "1930-01-01")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birthが空だと登録できない" do
      user = User.new(nickname: "testtarou", email: "kkk@gmail.com", password: "aaaa0000", password_confirmation: "aaaa0000", family_name: "てすと", first_name: "太郎", family_name_kana: "テスト", first_name_kana: "タロウ", birth: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end
  end
end
