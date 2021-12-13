class OrderController < ApplicationController
  before_action :new_order, only: [:new]

  def new
    session["cart"].each do |item|
      @order.carts.build(load_cart(item))
    end
  end

  private

  def new_order
    @order = Order.new(user:         User.includes(:addresses).find(current_user.id),
                       order_status: OrderStatus.find_by(name: "New"))
    @order.address = (@order.user.addresses.first unless @order.user.addresses.nil?)
  end

  def set_tax
    if @order.address.province.hst.positive?
      @order.address.province.hst
    else
      @order.address.province.pst + @order.address.province.gst
    end
  end

  def load_cart(item)
    cart_item = Cart.new(quantity: 1, product: Product.find(item))
    cart_item.price = cart_item.product.price
    cart_item.tax = set_tax
    cart_item
  end
end
