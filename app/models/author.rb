class Author < ActiveRecord::Base
  has_many :books

  validates_presence_of :name, :gender
  validates_numericality_of :n_books, greater_than_or_equal_to: 0
end