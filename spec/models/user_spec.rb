require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid' do
    user = User.create!(name: 'bri', username: 'britannic', email: 'bri@gmail.com', password: '123', password_confirmation: '123')
    expect(user).to be_valid
  end

  it 'is invalid without a email' do
    expect(User.create(name: 'bri', username: 'britannic', password: '123', password_confirmation: '123')).to_not be_valid
  end

# it 'orders by name' do
#   bri = User.create!(name: 'bri', username: 'bri', email: 'bri@gmail.com', password: '123', password_confirmation: '123')
#   anh = User.create!(name: 'anh', username: 'anh', email: 'brit@gmail.com', password: '123', password_confirmation: '123')
#
#   expect(User.ordered_by_username).to eq([anh, bri])
# end
end
