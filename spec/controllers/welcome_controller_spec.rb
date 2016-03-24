require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  describe "GET #index" do
    it 'response successfully an http 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
