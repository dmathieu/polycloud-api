require 'spec_helper'

describe Api::V1::Users::MainController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "show" do
    it "should be success" do
      get :show, id: user.to_param, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('user')
      expect(json['user']).to have_key('id')
    end
  end

  describe "create" do
    it "should create a user" do
      lambda do
        post :create, user: {email: 'me@test.host', password: 'testing'}, format: :json
      end.should change(User, :count).by(1)
      expect(response).to be_success

      json = JSON.parse(response.body)
      expect(json).to have_key('user')
      expect(json['user']).to have_key('id')
    end
  end
end
