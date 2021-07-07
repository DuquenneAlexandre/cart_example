class Product
  attr_reader :name, :ref, :price

  def initialize(params)
    @name, @ref, @price = params[:name], params[:ref], params[:price]
  end

end
