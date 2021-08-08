class Cart
  attr_reader :products_arr, :promo_array

  def initialize(products_arr, promo_array)
    @products_arr, @promo_array = products_arr, promo_array
  end

  def self.deal_products(cart)
    sum_prices = 0
    cart.promo_array.each do | promo |
      if promo[:promo_type] === 0
        pr_arr = alim_that_array(cart.products_arr, [], promo[:ref])
        !pr_arr.empty? ? sum_prices += Pricing_rule.no_rule(pr_arr) : false
      end
      if promo[:promo_type] === 1
        pr_arr = alim_that_array(cart.products_arr, [], promo[:ref])
        !pr_arr.empty? ? sum_prices += Pricing_rule.buy_one_get_one(pr_arr) : false
      end
      if promo[:promo_type] === 2
        pr_arr = alim_that_array(cart.products_arr, [], promo[:ref])
        !pr_arr.empty? ? sum_prices += Pricing_rule.three_or_more(pr_arr, promo[:amount]) : false
      end
    end
    sum_prices
  end

  private

  def self.alim_that_array(products_arr, empty_arr, ref)
    products_arr.map{| product | product.ref == ref ? empty_arr << product : false}
    empty_arr
  end

end
