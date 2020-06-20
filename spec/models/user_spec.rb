require 'rails_helper'

RSpec.describe User, type: :model do
  context "user data validation" do
    it "validates email" do
      u = User.new(email: 'yu')

      expect(u).to be_valid
      expect(u.email).to eq "yu"
    end

    it "invalidates email" do
      u = User.new

      expect(u).not_to be_valid
    end
  end
end
