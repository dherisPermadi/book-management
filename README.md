# README

# Set the ENV Variable
  - Create .env file
  - Set value to variables DATABASE_USERNAME,DATABASE_PASSWORD and DATABASE_NAME

# Gem Install
  - run Bundle Install
 
# Database Build
  - run rake db:create
  - run rake db:migrate

# Run Test-Case
  - run ruby test/unit/author_test.rb to test authors
  - run ruby test/unit/book_test.rb to test books

# Generate data from JSONS
  - run rake db:seed
