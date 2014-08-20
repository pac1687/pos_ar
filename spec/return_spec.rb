require "spec_helper"

describe Return do
  before do
    setup
  end

  it { should belong_to :purchase }
  it { should have_many(:products).through(:purchase) }

  # it 'has many products through purchases' do
  #   expect(@test_return.purchase.product).to eq @test_product
  # end
end
