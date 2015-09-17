require 'rails_helper'

RSpec.describe Category, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:category) do
    Category.new(name: "Math")
  end
  let(:valid_attributes) do
    {name: "Math" }
  end

  it "is valid" do
    expect(category).to be_valid
  end

  it "is invalid without a name" do
    category.name = nil
    expect(category).not_to be_valid
  end

  it "is invalid if the name is not unique" do
    Category.create(valid_attributes)
    expect(category).not_to be_valid
  end
end
