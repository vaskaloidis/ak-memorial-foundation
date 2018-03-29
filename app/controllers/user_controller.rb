class UserController < ApplicationController
  before_action :set_user, only: [:edit, :update]


  def edit
  end

  # PATCH/PUT /invites/1
  # PATCH/PUT /invites/1.json
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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note)
  end
end
