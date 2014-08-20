require "spec_helper"

describe Customer do
  before do
    setup
  end

  it { should have_many :sales }

end
