require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success) #200
    end
  end

  describe "Get /show" do
    it "return a specific user" do
      user = User.create(name: "Binyam", photo: "url", bio: "I am a software developer.")
      user_url = "/users"
      get user_url(user)
      expect(response).to be_successful
    end
  end
end
