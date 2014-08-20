require "spec_helper"

describe Purchase do
  it { should have_many :returns }
  it { should belong_to :sale}

end
