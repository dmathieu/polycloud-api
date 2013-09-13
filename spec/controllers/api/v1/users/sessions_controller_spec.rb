require 'spec_helper'

describe Api::V1::Users::SessionsController do
  let(:user) { FactoryGirl.create(:user) }

  describe "create" do
    it "should sign the user in" do
      lambda do
        post :create, session: {email: user.email, password: user.password}, format: :json
        user.reload
      end.should change(user, :token)
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('user')
      expect(json['user']).to have_key('token')
      expect(json['user']['token']).to eql(user.token)
    end

    it "should not sign in" do
      lambda do
        post :create, session: {email: user.email, password: 'hello_world'}, format: :json
        user.reload
      end.should_not change(user, :token)
      expect(response.status).to eql(401)
    end
  end
end
