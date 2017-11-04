require 'test_helper'

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beers_index_url
    assert_response :success
  end

  test "should get import" do
    get beers_import_url
    assert_response :success
  end

end
