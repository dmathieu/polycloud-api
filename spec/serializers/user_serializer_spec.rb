require 'spec_helper'

describe UserSerializer do

  it { should include_root }

  it { should have_attribute(:id) }
  it { should have_attribute(:email) }

  it { should_not  have_attribute(:encrypted_password) }
  it { should_not have_attribute(:token) }
end
