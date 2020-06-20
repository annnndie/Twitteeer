require 'rails_helper'

RSpec.describe User, type: :model do
  context "user data validation" do
    it "validate user" do
      u = User.new(email: 'yu@andy.io')
      expect(u).to be_valid
    end

    it "invalidate user" do
      u = User.new
      expect(u).not_to be_valid
    end

    it "is invalid email format" do
      u = User.new(email: 'yu')

      expect(u).not_to be_valid
    end

    it "is valid email format" do
      u = User.new(email: 'loveyu@andyu.io')

      expect(u).to be_valid
    end
  end
end
