require 'test_helper'

class BookDetailTest < ActiveSupport::TestCase

  test "should not save book details without book" do
    @book_detail = book_details(:one)
    assert_not @book_detail.save
  end

  test "should not save book details without necessary information" do
    @book = books(:one)
    @book_detail = BookDetail.new
    
    @book.save
    assert_not @book_detail.save
  end

  test "should save book details" do
    @book = books(:one)
    @book_detail = book_details(:one)
    @book_detail.book_id = @book.id

    @book.save
    
    assert @book_detail.save
  end

end
