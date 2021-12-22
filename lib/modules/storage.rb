require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/classroom'
require_relative '../classes/student'
require_relative '../classes/rental'
require_relative '../classes/teacher'
require 'json'

module Storage
    def from_file(people: nil, books: nil, rentals: nil)
        from_file_to_books(books) if books
    end

    def from_books_to_file
        books_json = []
        @books.each do |book|
          books_json.push(book.to_json)
        end
    
        books_json = JSON.dump({
                                 books: books_json
                               })
    
        File.write('books.json', books_json)
    
    end

    
end


