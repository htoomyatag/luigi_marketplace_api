require "test_helper"

class V1::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @v1_book = v1_books(:one)
  end

  test "should get index" do
    get v1_books_url, as: :json
    assert_response :success
  end

  test "should create v1_book" do
    assert_difference("V1::Book.count") do
      post v1_books_url, params: { v1_book: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show v1_book" do
    get v1_book_url(@v1_book), as: :json
    assert_response :success
  end

  test "should update v1_book" do
    patch v1_book_url(@v1_book), params: { v1_book: {  } }, as: :json
    assert_response :success
  end

  test "should destroy v1_book" do
    assert_difference("V1::Book.count", -1) do
      delete v1_book_url(@v1_book), as: :json
    end

    assert_response :no_content
  end
end
