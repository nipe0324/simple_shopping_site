class StoreController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_admin!

  def index
  	@products = Product.order(:name)
  	@cart = current_cart
  end
end
