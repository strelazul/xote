ActiveAdmin.register Stock do
  permit_params :quantity,
                :made_on,
                :durable_life,
                :product_id

  form do |f|
    f.inputs "Product stock" do
      f.input :product
      f.input :quantity
      f.input :made_on,
              start_year: Time.zone.today.year - 1,
              end_year:   Time.zone.today.year,
              default:    Time.zone.today
      f.input :durable_life, min: 0, max: 90
    end
  end
end
