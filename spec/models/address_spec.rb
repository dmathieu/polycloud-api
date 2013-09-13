require 'spec_helper'

describe Address do

  it { should have_many(:users) }

  it { should validate_uniqueness_of(:ip) }
end
