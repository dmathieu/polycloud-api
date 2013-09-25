require 'spec_helper'

describe Address do

  it { should have_many(:users) }
  it { should have_many(:snippets) }
  it { should have_many(:languages) }

  it { should validate_uniqueness_of(:ip) }
end
