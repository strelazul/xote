class UsersController < ApplicationController
  def edit
    @user = User.includes(:addresses).find(params[:id])
    @addresses = Address.find_or_initialize_by(user_id: params[:id])
    @user[:email] = current_user.email
    @user.addresses.build(@addresses.attributes)
  end

  def show
    @user = User.includes(:addresses).find(params[:id])
  end

  def update
    @user = User.includes(:addresses).find(params[:id])

    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :birthday, :email,
                                 addresses_attributes: %i[id name line01 line02 postal_code city user_id province_id])
  end
end
