require './test/test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :books

  def test_book
    first_book = Book.new :author_id => books(:first_book).author_id, 
      :author_name => books(:first_book).author_name,
      :content_name => books(:first_book).content_name,
      :year => books(:first_book).year,
      :genres => books(:first_book).genres,
      :title => books(:first_book).title,
      :genres => books(:first_book).genres,
      :average_rating => books(:first_book).average_rating,
      :pages => books(:first_book).pages,
      :description => books(:first_book).description,
      :language => books(:first_book).language,
      :release_date => books(:first_book).release_date

     assert first_book.save

     first_book_copy = Book.find(first_book.id)

     assert_equal first_book.title, first_book_copy.title

     first_book.title = 'Mountain Auckland Monster'

     assert first_book.save
     assert first_book.destroy
  end
end
