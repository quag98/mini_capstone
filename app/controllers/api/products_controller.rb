class Api::ProductsController < ApplicationController
  def all_product_action
    @products = Product.all
    render "all_product.json.jb"
  end
end
