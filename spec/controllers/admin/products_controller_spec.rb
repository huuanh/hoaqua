require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

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

  let(:valid_attributes) {
    {name: 'banana', price: '10939', make: 'chile'}
  }

  let(:invalid_attributes) {
    {name: nil, price: '10939', make: 'chile'}
  }

  let(:valid_session) { {user: admin} }

  let(:new_attributes) {{name: 'new new new', price: '00000', make: 'French'}}

  describe "POST #create" do
    context "with valid params" do
      it "creates a new product" do
        get "/login"
        assert_select "form.login" do
          assert_select "input[name=?]", "bri@gmail.com"
          assert_select "input[name=?]", "123"
          assert_select "input[type=?]", "submit"
        end
        expect {
          post :create, {:product => valid_attributes}, valid_session
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => valid_attributes}, valid_session
        expect(assigns(:product)).to be_a(Product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        post :create, {:product => valid_attributes}, valid_session
        expect(response).to redirect_to(product.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, {:product => invalid_attributes}, valid_session
        expect(assigns(:product)).to be_a_new(product)
      end

      it "re-renders the 'new' template" do
        post :create, {:product => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET #new" do
    it "assigns a new product as @product" do
      get :new, {name: 'tomato', price: '5982', make: 'china', discription: 'nothing'}, valid_session
      expect(assigns(:product)).to be_a_new(Product)
    end
  end

  describe "GET #edit" do
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :edit, {:id => product.to_param}, valid_session
      expect(assigns(:product)).to eq(product)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new product" do
        expect {
          post :create, {:product => valid_attributes}, valid_session
        }.to change(Product, :count).by(1)
      end

      it "assigns a newly created product as @product" do
        post :create, {:product => valid_attributes}, valid_session
        expect(assigns(:product)).to be_a(product)
        expect(assigns(:product)).to be_persisted
      end

      it "redirects to the created product" do
        post :create, {:product => valid_attributes}, valid_session
        expect(response).to redirect_to(product.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved product as @product" do
        post :create, {:product => invalid_attributes}, valid_session
        expect(assigns(:product)).to be_a_new(Product)
      end

      it "re-renders the 'new' template" do
        post :create, {:product => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => new_attributes}, valid_session
        product.reload
        expect(Product.last.name).to eq('new new new')
      end

      it "assigns the requested product as @product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
        expect(assigns(:product)).to eq(product)
      end

      it "redirects to the product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => valid_attributes}, valid_session
        expect(response).to redirect_to(product)
      end
    end

    context "with invalid params" do
      it "assigns the product as @product" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => invalid_attributes}, valid_session
        expect(assigns(:product)).to eq(product)
      end

      it "re-renders the 'edit' template" do
        product = Product.create! valid_attributes
        put :update, {:id => product.to_param, :product => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, {:id => product.to_param}, valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, {:id => product.to_param}, valid_session
      expect(response).to redirect_to(products_url)
    end
  end
end
