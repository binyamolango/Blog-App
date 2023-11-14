require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success for users#index action" do
      get users_url
      expect(response).to have_http_status(:success) #200
      expect(response.body).to include("Here is a list of users.")
    end
  end

  describe "Get /show" do
    it "return a specific user for users#show action" do
      user = User.create(name: "Binyam", photo: "url", bio: "I am a software developer.")
      get user_url(user)
      expect(response).to be_successful
      expect(response.body).to include("Here is a specific user.")
    end
  end
end
