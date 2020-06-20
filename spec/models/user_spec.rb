require 'rails_helper'

RSpec.describe User, type: :model do
  context "user data validation" do

    it "validate user" do
      u = build(:user)
      expect(u).to be_valid
    end

    it "is invalid email format" do
      u = build(:user, :invalid_email)

      expect(u).not_to be_valid
    end

    it "is valid email format" do
      u = build(:user)

      expect(u).to be_valid
    end

    it "unique email" do
      u = create(:user)

      another = u.dup
      # 用 dup 複製一次 u 的 create 動作做驗證
      another.save

      expect(another).not_to be_valid
    end

    it "password length" do
      u = build(:user, :invalid_password)

      expect(u).not_to be_valid
    end
    
  end
end
