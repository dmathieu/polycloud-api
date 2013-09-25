require 'spec_helper'

describe Language do

  it { should have_many(:snippets) }
  it { should belong_to(:address) }

  it { should validate_presence_of(:title) }
end
