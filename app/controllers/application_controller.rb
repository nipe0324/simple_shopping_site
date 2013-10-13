class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end

  private
  def current_cart
  	begin
	  	Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
    	cart = Cart.create
    	session[:cart_id] = cart.id
    	cart
  	end
  end

  # Check if the user role is 'admin' or not. 
  # Redirect to 'root_url' if user doesn't log in or user role isn't 'admin'.
  def authenticate_admin!
    unless user_signed_in? && current_user.role == 'admin'
      redirect_to root_url
    end
  end
end
