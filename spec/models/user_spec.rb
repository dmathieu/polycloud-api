require 'spec_helper'

describe User do

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:encrypted_password) }
  it { should validate_presence_of(:token) }

  describe "password" do
    it "should set the encrypted password" do
      lambda do
        subject.password = 'testing'
      end.should change(subject, :encrypted_password)
    end
  end

  describe "valid_password?" do
    it "should be valid" do
      subject.password = 'hello'
      expect(subject.valid_password?('hello')).to be_true
    end

    it "should not be valid" do
      subject.password = 'hello'
      expect(subject.valid_password?('world')).to be_false
    end
  end

  describe "refresh_token!" do
    subject { FactoryGirl.create(:user) }

    it "should change the token" do
      lambda do
        subject.refresh_token!
      end.should change(subject, :token)
    end
  end
end
