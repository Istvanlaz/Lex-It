require 'test_helper'

class ClassNotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get class_notes_index_url
    assert_response :success
  end

  test "should get show" do
    get class_notes_show_url
    assert_response :success
  end

  test "should get new" do
    get class_notes_new_url
    assert_response :success
  end

  test "should get edit" do
    get class_notes_edit_url
    assert_response :success
  end

end
