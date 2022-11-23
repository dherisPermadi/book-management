require './test/test_helper'

class AuthorTest < ActiveSupport::TestCase
  fixtures :authors

  def test_author
    first_author = Author.new :id => authors(:first_author).id, 
      :name => authors(:first_author).name,
      :gender => authors(:first_author).gender,
      :n_books => authors(:first_author).n_books,
      :summary => authors(:first_author).summary,
      :born => authors(:first_author).born,
      :died => authors(:first_author).died

     assert first_author.save

     first_author_copy = Author.find(first_author.id)

     assert_equal first_author.name, first_author_copy.name

     first_author.name = 'Aulus Fermus'

     assert first_author.save
     assert first_author.destroy
  end
end
