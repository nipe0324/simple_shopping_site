class OrdersController < ApplicationController
  before_action :authenticate_user!

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order('updated_at desc')
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @cart = current_cart
    if @cart.order_details.empty?
      redirect_to store_url, notice: t('controllers.new_order_details_empty')
      return
    end

    @order = Order.new(user_id: current_user.id)
    @order.address ||= current_user.address
  end

  # GET /orders/1/edit
  def edit
    @order = Order.new(user_id: current_user.id)
    # TODO 正しくない挙動の可能性がある
    # @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    @order.add_order_details_from_cart(current_cart)

    respond_to do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        format.html { redirect_to store_url, notice: t('controllers.create_success') }
        format.json { render json: @order, status: :created, location: @order }
      else
        @cart = current_cart
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  # PUT /orders/1/shipped
  def shipped
    @order = Order.find(params[:id])
    if @order.update_attribute(:status, 'shipped')
      OrderNotifier.shipped(@order).deliver
      redirect_to orders_url, notice: t('controllers.shipped')
    else
      render action: 'index'
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:address, :pay_type)
    end
end
