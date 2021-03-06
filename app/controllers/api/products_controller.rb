class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  # def all_product_action
  #   @products = Product.all
  #   render "all_product.json.jb"
  # end

  # def single_product_action
  #   @product = Product.find_by(id: 1)
  #   render "single_product.json.jb"
  # end

  # def single_search_action
  #   input_option = params["id_number"]
  #   @product = Product.find_by(id: input_option)
  #   render "query_param.json.jb"
  # end

  def index
    @products = Product.all
    if params[:category]
      category = Category.find_by(name: params[:category])
      @products = category.products
    end
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
      description: params[:description],
      supplier_id: params[:supplier_id],
    )
    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description

    if @product.save
      render "show.json.jb"
    else
      render json: { errors: @product.errors.full_messages }, status: 406
    end
  end

  def destroy
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.destroy
    render json: { message: "it is gone" }
  end
end
