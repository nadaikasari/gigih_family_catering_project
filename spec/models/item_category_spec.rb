require 'rails_helper'

RSpec.describe ItemCategory, type: :model do

  before :each do
    @menu = create(:menu)
    @category = create(:category)
  end

  it 'is valid with a id', :name do
    expect(FactoryBot.build(:item_category)).to be_valid
  end
  
  it'should belongs_to :menu' do
      expect(ItemCategory.reflect_on_association(:menu).macro).to eq :belongs_to
  end

  it'should belongs_to :categories' do
      expect(ItemCategory.reflect_on_association(:category).macro).to eq :belongs_to
  end
  
end
