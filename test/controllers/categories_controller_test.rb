require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:two)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should not get index without singing in admin" do
    sign_out users(:admin)
    get :index
    assert_redirected_to root_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category success" do
    assert_difference('Category.count') do
      post :create, category: { name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should create category failure" do
    assert_no_difference('Category.count') do
      post :create, category: { name: '' }
    end

    assert_response :success
    assert_template 'new'
  end  

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category success" do
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should update category failure" do
    patch :update, id: @category, category: { name: '' }
    assert_response :success
    assert_template 'edit'
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
