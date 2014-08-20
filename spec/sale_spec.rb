require "spec_helper"

describe Sale do
  before do
    setup
  end

  it { should have_many :purchases }

end
