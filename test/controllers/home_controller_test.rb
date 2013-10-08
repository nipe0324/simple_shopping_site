require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get login page when not authenticated" do
  	get :index
  	assert_response :success
  	# TODO ログイン画面に遷移するassetを追加
  end

  test "should get user_edit page when authenticated as a user" do
  	sign_in users(:one)
  	get :index
  	assert_response :success
  	# TODO ユーザ名の編集画面に遷移するassertを追加
  end
end
