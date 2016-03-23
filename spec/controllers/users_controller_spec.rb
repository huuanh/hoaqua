require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) {{name: 'bri', username: 'bri', email: 'bri@gmail.com', password: '123', password_confirmation: '123'}}
  let(:invalid_attributes) {{name: 'anh', username: nil, email: 'bri@gmail.com', password: '123', password_confirmation: '123'}}
  let(:update_attributes){{name: 'ngonngon', username: 'ngon'}}

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates the USER' do
        post :create, user: valid_attributes
        expect(User.count).to eq(1)
      end

      it 'redirects to the "show" action for the new user' do
        post :create, user: valid_attributes
        expect(response).to redirect_to User.first
      end
    end

    context 'with invalid attributes' do
      it 'does not create the user' do
        post :create, user: invalid_attributes
        expect(User.count).to eq(0)
      end

      it 're-renders the "new" view' do
        post :create, user: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    it 'update the user' do
      user = User.create! valid_attributes
      put :update, {:id => user.to_param, user: update_attributes}
      expect(User.last.name).to eq('ngonngon')
    end
  end
end
