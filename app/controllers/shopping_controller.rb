class ShoppingController < ApplicationController
  def product_display
  end

  def shop
  	@products = Product.all;
  end
end
