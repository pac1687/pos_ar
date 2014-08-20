require "spec_helper"

describe Product do
  before do
    setup
  end

  it { should have_many :purchases }

end
