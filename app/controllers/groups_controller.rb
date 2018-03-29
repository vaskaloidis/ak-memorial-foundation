class GroupsController < ApplicationController
  before_action :set_user, only: [:edit_group]


  def edit_group
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:user_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invite_params
    params.require(:user).permit(:golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email)
  end
end
