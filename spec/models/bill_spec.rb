require 'rails_helper'

RSpec.describe Bill, type: :model do
  let(:product) {Product.create!(name: 'apple', price: '100', make: 'china')}
  let(:user) {User.create!(name: 'bri', username: 'britannic', email: 'bri@gmail.com', password: '123', password_confirmation: '123', admin: true)}

  it 'has a valid' do
    bill = Bill.create!(user_id: user.id, product_id: product.id, number: 3)
    expect(bill).to be_valid
  end
end
