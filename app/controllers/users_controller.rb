class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  respond_to :js, only: [:destroy]

  def index
    @users = User.where(admin: false).all
    authorize @users
  end

  def profile
    @user = current_user
    authorize @user
  end

  def show; end

  def new
    @user = User.new
    authorize @user
  end

  def edit; end

  def create
    @user = User.new(user_params)
    authorize @user
    respond_to do |format|
      if @user.save
        format.html {redirect_to @user, notice: 'User was successfully created.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    @user.update(user_params)
    respond_to do |format|
      if @user.valid?
        format.html {redirect_to @user, notice: 'User was successfully updated.'}
        format.json {render :show, status: :ok, location: @user}
      else
        format.html {render :edit}
        format.json {render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    # @user.discard # TODO: Test setting this up
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end

  def user_params
    params.require(:user).permit(:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note)
  end
end
