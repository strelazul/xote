ActiveAdmin.register Product do
  permit_params :name,
                :description,
                :price,
                :alcohol,
                :category_id,
                :image

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :image, as: :file
      f.input :description
      f.input :price
      f.input :alcohol
      f.input :category
    end
    f.actions
  end

  show do
    attributes_table do
      row :category
      row :name
      row :image do |prod_img|
        if prod_img.image.attached?
          image_tag url_for(prod_img.image.variant(resize_to_limit: [nil,
                                                                     100]).processed)
        end
      end
      row :description
      row :price
      row :alcohol
    end
  end
end
