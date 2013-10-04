require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select 'header #ttl h1', 1
    assert_select '#contents .entry', 2
  end

end
