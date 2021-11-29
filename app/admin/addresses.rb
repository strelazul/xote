ActiveAdmin.register Address do
  permit_params :name,
                :line01,
                :line02,
                :postal_code,
                :city_id,
                :user_id
end
