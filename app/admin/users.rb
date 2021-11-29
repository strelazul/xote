ActiveAdmin.register User do
  permit_params :first_name,
                :last_name,
                :birthday,
                :email,
                :login,
                :password,
                addresses_attributes: %i[id name line01 line02 postal_code city_id
                                         _destroy]

  form do |f|
    f.inputs "Personal Data" do
      f.input :first_name
      f.input :last_name
      f.input :birthday, start_year: 1900, end_year: Time.zone.today.year
      f.input :email
    end

    f.inputs "Login Data" do
      f.input :login
      f.input :password
    end

    f.inputs "Addresses" do
      f.has_many :addresses, heading:       "Addresses",
                             allow_destroy: true,
                             new_record:    true do |a|
        a.input :name, label: "Address type"
        a.input :line01
        a.input :line02
        a.input :postal_code
        a.input :city
      end
    end
    f.actions
  end
end
