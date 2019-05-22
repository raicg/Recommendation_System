require 'rails_helper'

RSpec.describe SeriesController, type: :controller do

  describe "GET #list" do
    it "returns http success" do
      get :list
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #details" do
    it "returns http success" do
      get :details
      expect(response).to have_http_status(:success)
    end
  end

end
