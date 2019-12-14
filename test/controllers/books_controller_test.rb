require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @book_detail = book_details(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :found
  end

  test "should create book" do
    @new_book = books(:two)
    @new_book_detail = book_details(:two)
    
    post '/books', params: {book: { author_name: @new_book.author_name, book_name: "Endymion", in_series: @new_book.in_series, seq_in_series: "3", synopsis: @new_book.synopsis, book_detail_attributes: [ edition: @new_book_detail.edition, isbn: "0553572946" ] } } 
    follow_redirect!
    assert_response :success

  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :found
  end

  test "should update book" do
    patch book_url(@book), params: {book: { author_name: @book.author_name, book_name: @book.book_name, in_series: @book.in_series, seq_in_series: @book.seq_in_series, synopsis: @book.synopsis, book_detail_attributes: [ edition: @book_detail.edition, isbn: @book_detail.isbn ] } } 
    assert_response :found
  end

  test "should destroy book" do
    delete book_url(@book)
    follow_redirect!
    assert_response :success
  end
end
