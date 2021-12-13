class OrdersController < ApplicationController
  before_action :new_order, only: [:new]

  def new
    session["cart"].each do |item|
      @order.carts.build(load_cart(item).attributes)
    end
    @order.tax = set_tax
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update_taxes
    @order.address = Address.new(province_id: params[:province_id])
    @order.tax = set_tax
    render :new
  end

  private

  def new_order
    @order_total ||= 0
    @order ||= Order.new(user:         User.includes(:addresses).find(current_user.id),
                         order_status: OrderStatus.find_by(name: "New"))
    @order.address ||= @order.user&.addresses&.first
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
    @order_total += cart_item.price
    cart_item
  end

  def order_params
    params.require(:order).permit(:id, :tax, :user_id, :order_status_id, :address_id,
                                  carts_attributes: %i[id product_id quantity price])
  end
end
