# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  #
  # # POST /resource
  def create
    super

    cart = ShoppingCart.new
    cart.user = current_user
    cart.product = Product.golf_package
    cart.amount = Product.golf_package.price
    cart.save
  end
  #
  # # GET /resource/edit
  # def edit
  #   super
  # end
  #
  # # PUT /resource
  # def update
  #   super
  # end
  #
  # # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end


  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    new_charge_path
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
