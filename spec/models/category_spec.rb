require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    expect(FactoryBot.build(:category)).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryBot.build(:category, name: nil)

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicated name', :invalid_name do
    category = FactoryBot.create(:category, name: "Beverage")
    category = FactoryBot.build(:category, name: "Beverage")

    category.valid?

    expect(category.errors[:name]).to include("has already been taken")
  end
  
end
