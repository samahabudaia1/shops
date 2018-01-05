module ProductsHelper

	def basket_total
    Product.where(id: basket.to_a).sum(:price)
  end
end
