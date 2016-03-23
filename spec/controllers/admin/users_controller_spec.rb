require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do

  let!(:admin) { User.create!({name: 'bri1admin', username: 'bri1admin', email: 'bri1admin@gmail.com', password: '123', password_confirmation: '123'}) }
  let!(:user) { User.create!({name: 'anh', username: 'anh', email: 'anh@gmail.com', password: '123', password_confirmation: '123'}) }

  let!(:update_params) do
    { id: user.id, user_id: user.id, user: user }
  end

  let!(:user_params) { user_params = { username: "username#{rand(1000)}",
                                       email: "user#{rand(1000)}@factory.com",
                                       password: "Password123",
                                       password_confirmation: "Password123",
  } }

  let(:valid_attributes) {{name: 'bri', username: 'bri', email: 'bri@gmail.com', password: '123', password_confirmation: '123'}}
  let(:invalid_attributes) {{name: 'anh', username: nil, email: 'bri@gmail.com', password: '123', password_confirmation: '123'}}
  let(:update_attributes){{name: 'ngonngon', username: 'ngon'}}

  describe 'POST #create' do
    context 'no admin' do
      it 'create funtion' do
        post :create, user: valid_attributes
        expect(response).to redirect_to root_path
      end
    end
  end

  describe 'PUT #update' do
    it 'update the user' do
      user = User.create! valid_attributes
      put :update, {:id => user.to_param, user: update_attributes}
      expect(User.last.name).to eq('bri')
    end
  end
end
