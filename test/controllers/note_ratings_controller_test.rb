require 'test_helper'

class NoteRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get note_ratings_new_url
    assert_response :success
  end

end
