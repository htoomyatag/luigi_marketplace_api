require "test_helper"

class V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_user = v1_users(:one)
  end

  test "should get index" do
    get v1_users_url, as: :json
    assert_response :success
  end

  test "should create v1_user" do
    assert_difference("V1::User.count") do
      post v1_users_url, params: { v1_user: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show v1_user" do
    get v1_user_url(@v1_user), as: :json
    assert_response :success
  end

  test "should update v1_user" do
    patch v1_user_url(@v1_user), params: { v1_user: {  } }, as: :json
    assert_response :success
  end

  test "should destroy v1_user" do
    assert_difference("V1::User.count", -1) do
      delete v1_user_url(@v1_user), as: :json
    end

    assert_response :no_content
  end
end
