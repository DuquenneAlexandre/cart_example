class Pricing

  def self.apply_new_price(products, reduce_amount)
    products.map{ |product| Product.new({name: product.name,
      ref: product.ref,
      price: Pricing.reduce_price(product.price, reduce_amount)})}
  end

  def self.reduce_price(price_param, reduce_amount)
    price_param - price_param * reduce_amount.to_f / 100
  end

  def self.total_price(products)
    products.map(& :price).inject(:+).round(2)
  end

end
