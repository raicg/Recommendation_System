require 'rails_helper'

RSpec.describe RatingController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #result" do
    it "returns http success" do
      get :result
      expect(response).to have_http_status(:success)
    end
  end

end
