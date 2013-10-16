require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#contents .entry', 2
  end

  test "markup needed for store.js.coffee is in place" do
  	get :index
  	assert_select '.store .entry > img', 2
  end
end
