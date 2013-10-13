class OrderDetailsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :authenticate_admin!

  # GET /order_details
  # GET /order_details.json
  def index
    @order_details = OrderDetail.all
  end

  # Use store#index =cart_in=> cart#show
  # POST /order_details
  # POST /order_details.json
  def create
    @cart = current_cart
    product = Product.find(order_detail_params[:product_id])
    @order_detail = @cart.add_product(product.id)

    respond_to do |format|
      if @order_detail.save
        format.html { redirect_to store_url, notice: t('controllers.create_cart') }
        format.js   # views/order_details/create.js.erb
        format.json { render action: 'show', status: :created, location: @order_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_details/1
  # DELETE /order_details/1.json
  def destroy
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.destroy
    respond_to do |format|
      format.html { redirect_to order_details_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_detail_params
      params.require(:order_detail).permit(:product_id, :cart_id)
    end

    def product_id_params
      params.permit(:product_id)
    end
end
