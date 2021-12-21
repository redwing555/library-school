require_relative '../classes/book'

class CreateBook
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    created_book = Book.new(title: title, author: author)
    @books.push(created_book)
    puts "Book successfully created! \n\n"
  end
end
