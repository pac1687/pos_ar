require "spec_helper"

describe Return do
  it { should belong_to :purchase }

  it 'has many products through purchases' do
    product = Product.create({:name => "iPad"})
    purchase = Purchase.create({:product_id => product.id, quantity: 5})
    purchase_return = Return.create({purchase_id: purchase.id})
    expect(purchase_return.purchase.product).to eq product
  end
end
