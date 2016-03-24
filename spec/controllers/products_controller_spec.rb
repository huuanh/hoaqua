require 'rails_helper'
require 'rspec/rails'

RSpec.describe ProductsController, type: :controller do
  describe "GET #index" do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the products have name look like parameter into @products' do
      product1, product2 = Product.create!(name: 'thanh long'), Product.create!(name: 'thien long')
      get :index, {:query => 'long'.to_param}
      expect(assigns(:products)).to eq([product1,product2])
    end
  end

  let(:valid_attributes) {
    {name: 'LifeTime T', price: '4999', make: 'china'}
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all products as @products" do
      product = Product.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:products)).to eq([product])
    end
  end

  describe "GET #show" do
    it "assigns the requested product as @product" do
      product = Product.create! valid_attributes
      get :show, {:id => product.to_param}, valid_session
      expect(assigns(:product)).to eq(product)
    end
  end
end
