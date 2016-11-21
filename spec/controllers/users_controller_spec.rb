require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #personal" do
    it "returns http success" do
      get :personal
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #appointment" do
    it "returns http success" do
      get :appointment
      expect(response).to have_http_status(:success)
    end
  end

end
