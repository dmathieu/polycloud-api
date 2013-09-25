require 'spec_helper'

describe Api::V1::Snippets::MainController do
  let(:user)     { subject.user }
  let(:language) { subject.language }
  subject        { FactoryGirl.create(:snippet) }

  before do
    sign_in user
  end

  describe "index" do
    it "should be success" do
      get :index, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('snippets')
      expect(json['snippets']).to_not be_empty
    end
  end

  describe "show" do
    it "should be success" do
      get :show, id: subject.to_param, format: :json
      expect(response).to be_success
      json = JSON.parse(response.body)

      expect(json).to have_key('snippet')
      expect(json['snippet']).to have_key('id')
    end
  end

  describe "create" do
    it "should create a snippet" do
      lambda do
        post :create, snippet: {content: 'Hello World', language_id: language.id}, format: :json
      end.should change(Snippet, :count).by(1)
      expect(response).to be_success
    end
  end

  describe "update" do
    it "should update a snippet" do
      lambda do
        put :update, id: subject.to_param, snippet: {content: 'Hola Mundo'}, format: :json
        subject.reload
      end.should change(subject, :content).to('Hola Mundo')
      expect(response).to be_success
    end
  end

  describe "destroy" do
    it "should remove a snippet" do
      lambda do
        delete :destroy, id: subject.to_param, format: :json
      end.should change(Snippet, :count).by(-1)
      expect(response).to be_success
    end
  end
end
