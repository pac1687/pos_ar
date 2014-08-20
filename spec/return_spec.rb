require "spec_helper"

describe Return do
  before do
    setup
  end

  it { should belong_to :purchase }

  it 'has many products through purchases' do
    expect(@test_return.purchase.product).to eq @test_product
  end
end
