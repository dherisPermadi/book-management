#generate authors
author_file_path = "#{Rails.root}/public/jsons/authors.json"
text_from_file = File.read(author_file_path)
author_data = JSON.parse(text_from_file)
author_data['authors'].each do |author_object|
  Author.find_or_create_by(
    id: author_object['id'],
    name: author_object['name'], 
    gender: author_object['gender'],
    n_books: author_object['n_books'],
    summary: author_object['summary'],
    born: author_object['born'],
    died: author_object['died']
  )
end

#generate books
book_file_path = "#{Rails.root}/public/jsons/books.json"
text_from_file = File.read(book_file_path)
book_data = JSON.parse(text_from_file)
book_data['books'].each do |book_object|
  Book.find_or_create_by(
    author_id: book_object['author'],
    content_name: book_object['content_name'], 
    author_name: book_object['author_name'],
    year: book_object['year'],
    category: book_object['category'],
    genres: book_object['genres'],
    title: book_object['title'],
    average_rating: book_object['average_rating'],
    pages: book_object['pages'],
    description: book_object['description'],
    language: book_object['language'],
    release_date: book_object['release_date']
  )
end
