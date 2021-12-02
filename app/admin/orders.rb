ActiveAdmin.register Order do
  permit_params :user_id,
                :address_id,
                :order_status_id,
                addresses_attributes:      %i[id _destroy],
                order_statuses_attributes: [:id],
                carts_attributes:          %i[id product_id quantity price tax]

  form do |f|
    f.semantic_errors(*f.object.errors.keys)
    f.inputs "Order Info" do
      f.input :user, label: "Customer"
      f.input :order_status, label: "Order Status"
      f.input :address
      f.has_many :carts, heading:       "Items",
                         allow_destroy: true do |item|
        item.input :product
        item.input :quantity
      end
    end
    f.actions
  end

  before_save do |order|
    order.carts.each do |cart|
      cart.order_id = order.id
      cart.price = cart.product.price
      cart.tax = if order.address.city.province.hst > 0
                   order.address.city.province.hst
                 else
                   order.address.city.province.pst + cart.tax = order.address.city.province.gst
                 end
    end
  end
end
