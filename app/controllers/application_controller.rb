class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  before_action :load_dependencies
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:warning] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
  end

  protected

  def load_dependencies
    require 'dotenv/load' unless Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note])
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note])

    keys = [:company_name, :company_website, :company_published_name, :first_name, :last_name, :address, :city, :state, :zip, :name, :phone, :fax, :golfer2_name, :golfer2_email, :golfer3_name, :golfer3_email, :golfer4_name, :golfer4_email, :note]

    # devise_parameter_sanitizer.for(:account_update).push(keys)
    # devise_parameter_sanitizer.for(:sign_up).push(keys)

  end


end
