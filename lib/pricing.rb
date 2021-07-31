class Pricing

  def self.apply_new_price(products, reduce_amout)
    products.map{ |product| Product.new({name: product.name,
      ref: product.ref,
      price: Pricing.reduce_price(product.price, reduce_amout)})}
  end

  def self.reduce_price(price_param, reduce_amout)
    price_param - price_param * reduce_amout.to_f / 100
  end

  def self.total_price(products)
    products.map(& :price).inject(:+).round(2)
  end

end
