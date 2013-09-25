require 'spec_helper'

describe LanguageSerializer do

  it { should include_root }

  it { should have_attribute(:id) }
  it { should have_attribute(:title) }
  it { should have_many(:snippets) }
end
