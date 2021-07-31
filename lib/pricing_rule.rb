class Pricing_rule

  def self.buy_one_get_one(products)
    if products.size >= 2
      if products.size.even?
        Pricing.total_price(Pricing.apply_new_price(products, 50))
      else
        last_product = products.pop()
        Pricing.total_price(Pricing.apply_new_price(products, 50)) + last_product.price
      end
    else
      Pricing.total_price(products)
    end
  end

  def self.three_or_more(products, reduce_amout)
    if products.size >= 3
      Pricing.total_price(Pricing.apply_new_price(products, reduce_amout))
    else
      Pricing.total_price(products)
    end
  end

end
