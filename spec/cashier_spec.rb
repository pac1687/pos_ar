require "spec_helper"

describe Cashier do
  before do
    setup
  end

  it { should have_many :sales }

end
