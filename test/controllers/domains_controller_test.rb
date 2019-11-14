require 'test_helper'

class DomainsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get domains_index_url
    assert_response :success
  end

end
