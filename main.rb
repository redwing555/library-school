require './student'
require './person'
require './book'
require './teacher'
require './rentals'

class Library

    def initialize()
        @books = []
        @rentals = []
        @people = []
    end

    def list_books
        puts "Your library is empty, add some books first !" if @books.empty?

        @books.each do |book|
            puts "Author: #{book.author},Title: #{book.title}"
        end
        puts
    end

    def list_people 
        puts "No person is added yet, add someone!" if @people.empty?
        
        @people.each do |person|
            person.validate_name
            puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
        end     
        puts   
    end

    def create_person
    end

    def create_book
    end

    def create_rental
    end

    def list_rentals_by_id
    end

    def run()
    end

end

def main
    app = Library.new()
    app.run()
end

main()