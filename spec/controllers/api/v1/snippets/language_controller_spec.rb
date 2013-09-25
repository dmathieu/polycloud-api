require 'spec_helper'

describe Api::V1::Snippets::LanguagesController do
  let(:user)     { FactoryGirl.create(:user) }
  subject        { FactoryGirl.create(:language) }

  before do
    sign_in user
  end

  describe "index" do
    it "should be success" do
      subject
      get :index, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('languages')
      expect(json['languages']).to_not be_empty
    end
  end

  describe "show" do
    it "should be success" do
      get :show, id: subject.to_param, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('language')
      expect(json['language']).to have_key('id')
    end
  end

  describe "create" do
    it "should create a language" do
      lambda do
        post :create, language: {title: 'Golang'}, format: :json
      end.should change(Language, :count).by(1)
      expect(response).to be_success
    end
  end

  describe "update" do
    it "should update a language" do
      lambda do
        put :update, id: subject.to_param, language: {title: 'Ruby'}, format: :json
        subject.reload
      end.should change(subject, :title).to('Ruby')
      expect(response).to be_success
    end
  end

  describe "destroy" do
    it "should remove a language" do
      subject
      lambda do
        delete :destroy, id: subject.to_param, format: :json
      end.should change(Language, :count).by(-1)
      expect(response).to be_success
    end
  end
end
