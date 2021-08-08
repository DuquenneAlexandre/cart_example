require_relative './lib/product'
require_relative './lib/pricing'
require_relative './lib/pricing_rule'
require_relative './lib/cart'

describe '.Cart' do

  products = []
  products << Product.new({name: "super_product", ref: "sp1", price: 2})
  products << Product.new({name: "super_product2", ref: "sp2", price: 5})
  products << Product.new({name: "super_product2", ref: "sp2", price: 5})
  products << Product.new({name: "super_product2", ref: "sp2", price: 5})
  products << Product.new({name: "super_product3", ref: "sp3", price: 10})
  products << Product.new({name: "super_product2", ref: "sp2", price: 5})
  products << Product.new({name: "super_product2", ref: "sp2", price: 5})
  products << Product.new({name: "super_product3", ref: "sp3", price: 10})
  products << Product.new({name: "super_product", ref: "sp1", price: 2})

  my_cart = Cart.new(products, [{ref: "sp1", promo_type: 1, amount: 50},
    {ref: "sp2", promo_type: 2, amount: 50},
  {ref: "sp3", promo_type: 2, amount: 33.33}])

  context '#total' do
    it 'return total price of the cart' do
      expect(Cart.deal_products(my_cart)).to eq(34.5)
    end
  end
end
