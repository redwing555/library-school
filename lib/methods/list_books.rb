class BookList
  def initialize(books)
    @books = books
  end

  def list_books
    puts "\n\nYour library is empty, add some books first!" if @books.empty?

    @books.each do |book|
      puts "  Author: #{book.author}, Title: #{book.title} \n\n"
    end
  end
end
