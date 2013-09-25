require 'spec_helper'

describe SnippetSerializer do

  it { should include_root }

  it { should have_attribute(:id) }
  it { should have_attribute(:user_id) }
  it { should have_attribute(:content) }
  it { should have_attribute(:language_id) }
end
