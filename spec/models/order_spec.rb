require 'rails_helper'

RSpec.describe Order, type: :model do
    it'should belongs_to :customer' do
        expect(Order.reflect_on_association(:customer).macro).to eq :belongs_to
    end

end
