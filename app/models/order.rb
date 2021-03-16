class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products
  # def subtotal
  #   @subtotal = product.price * quantity
  # end

  # def tax
  #   @tax = @subtotal * 0.09
  # end

  # def total
  #   @total = @tax + @subtotal
  # end
end
