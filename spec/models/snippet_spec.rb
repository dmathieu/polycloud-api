require 'spec_helper'

describe Snippet do
  subject { FactoryGirl.build(:snippet) }

  it { should belong_to(:address) }
  it { should belong_to(:user) }
  it { should belong_to(:language) }

  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:language) }

  describe "without authentication" do
    it { should_not validate_presence_of(:user) }
  end

  describe "with authentication" do
    before do
      subject.address.authenticate = true
    end

    it { should validate_presence_of(:user) }
  end
end
