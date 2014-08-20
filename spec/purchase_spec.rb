require "spec_helper"

describe Purchase do
  before do
    setup
  end

  it { should have_many :returns }
  it { should belong_to :sale}

end
