require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'has a valid' do
    product = Product.create!(name: 'apple', price: '3000', make: 'china')
    expect(product).to be_valid
  end

  it 'is invalid without a name' do
    expect(Product.create(name: nil, price: '3929', make: 'korea')).to_not be_valid
  end
end
