# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create]

  # GET /resource/sign_up
  # def new
  #   super
  # end
  #
  # # POST /resource
  def create
    super

    if resource.valid? and resource.errors.empty?
      # TODO: Finish the invitation system
      # user = User.find(resource.id)
      # resource.invite_golfer_two
      # resource.invite_golfer_three
      # resource.invite_golfer_four

      AdminMailer.with(customer_id: resource.id).registration_notifications.deliver_now
      # UserInviteMailer.with(email: @customer_email, project: @invoice.project.id).invite_user.deliver_now

      cart = ShoppingCart.new
      cart.user = resource
      cart.product = Product.golf_package
      cart.amount = Product.golf_package.price
      cart.save
    end

    # InviteUsersMailer.notify_registered(current_user).deliver_later
  end

  #
  # # GET /resource/edit
  # def edit
  #   super
  # end
  #
  # # PUT /resource
  def update
    super

    if self.resource.changed.include?('golfer_2email')
      current_user.invite_golfer_two
    end

    if self.resource.changed.include?('golfer_3email')
      current_user.invite_golfer_three
    end

    if self.resource.changed.include?('golfer_4email')
      current_user.invite_golfer_four
    end
  end

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

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end
  end

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

  def after_update_path_for(resource)
    user_path(resource)
  end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  #   new_charge_path
  # end
end
