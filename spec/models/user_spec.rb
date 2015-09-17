require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:user) do
    User.new(email: "somedude@gmail.com", user_name: "somedude", password: "password", password_confirmation: "password")
  end

  let(:valid_attributes) do
    {email: "somedude@gmail.com", user_name: "somedude", password: "password", password_confirmation: "password" }
  end

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid without a email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is invalid without a user_name" do
    user.user_name = nil
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    user.password_confirmation = nil
    expect(user).not_to be_valid
  end

  it "is invalid if the name is not unique" do
    User.create(valid_attributes)
    expect(user).not_to be_valid
  end
end
