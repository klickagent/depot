class StoreController < ApplicationController

  def index
    @products = Product.all
  end
  
  def index
  	@products = Product.all
  	@cart = current_cart
  end

end