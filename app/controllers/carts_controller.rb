class CartsController < ApplicationController
  # Use
  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "#{t('controllers.show_cart_error_log')}:#{params[:id]}"
      redirect_to store_url, notice: t('controllers.show_cart_error_view')
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end
  end

  # Use
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil

    respond_to do |format|
      format.html { redirect_to store_url, notice: t('controllers.destory_cart') }
      format.json { head :ok }
    end
  end
end
