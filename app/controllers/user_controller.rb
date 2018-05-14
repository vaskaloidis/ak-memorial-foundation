class UserController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :get_users, only: [:destroy]

  def edit
  end

  def update
    respond_to do |format|
      if @invite.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html {redirect_to root_path, notice: 'Product Removed From Cart'}
      format.json {head :no_content}
      format.js
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end

  def get_users
    @users = User.where(admin: false).all
  end

  def user_params
    params.require(:user).permit(:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note)
  end
end
