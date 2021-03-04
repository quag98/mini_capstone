class Api::ProductsController < ApplicationController
  # def all_product_action
  #   @products = Product.all
  #   render "all_product.json.jb"
  # end

  def single_product_action
    @product = Product.find_by(id: 1)
    render "single_product.json.jb"
  end

  def single_search_action
    input_option = params["id_number"]
    @product = Product.find_by(id: input_option)
    render "query_param.json.jb"
  end

  def index
    @products = Product.all
    render "index.json.jb"
  end

  def show
    id_search = params["id"]
    @product = Product.find_by(id: id_search)
    render "show.json.jb"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      description: params[:description],
    )
    @product.save
    render "show.json.jb"
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.image_url = params[:image_url] || @product.image_url
    @product.description = params[:description] || @product.description
    @product.save
    render "show.json.jb"
  end

  def destroy
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: { message: "it is gone" }
  end
end
