require 'spec_helper'

describe SessionSerializer do

  it { should include_root }

  it { should have_attribute(:id) }
  it { should have_attribute(:email) }
  it { should have_attribute(:token) }

  it { should_not  have_attribute(:encrypted_password) }
  it { should have_attribute(:token) }
end
