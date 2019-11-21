require 'test_helper'

class SavingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get savings_new_url
    assert_response :success
  end

  test "should get edit" do
    get savings_edit_url
    assert_response :success
  end

  test "should get create" do
    get savings_create_url
    assert_response :success
  end

  test "should get destroy" do
    get savings_destroy_url
    assert_response :success
  end

end
