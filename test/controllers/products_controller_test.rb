require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:two)
    @category = categories(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product success" do
    assert_difference('Product.count') do
      post :create, product: {
        description: @product.description, image_url: @product.image_url,
        name: @product.name, price: @product.price, category_id: @category.id }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should create product failure" do
    assert_no_difference('Product.count') do
      post :create, product: {
        description: '', image_url: '',
        name: '', price: @product.price, category_id: @category.id }
    end

    assert_response :success
    assert_template 'new'
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product success" do
    patch :update, id: @product, product: { description: @product.description, image_url: @product.image_url, name: @product.name, price: @product.price }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should update product failure" do
    patch :update, id: @product, product: { description: '', image_url: '', name: '', price: @product.price }

    assert_response :success
    assert_template 'edit'
  end


  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
