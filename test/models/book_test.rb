require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "should not save book without title" do
    @book = Book.new
    assert_not @book.save
  end

  test "should save book" do
    @book = books(:one)
    assert @book.save
  end

end
