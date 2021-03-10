class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: params[:user_id],
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: params[:subtotal],
      tax: params[:tax],
      total: params[:total],
    )
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: 406
    end
  end

  def show
    id_search = params["id"]
    @order = Order.find_by(id: id_search)
    render "show.json.jb"
  end
end
