require './student'
require './person'
require './book'
require './teacher'
require './rental'

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

    def menu
        puts 'Welcome to the School library! \n\n'
        puts "School Library Menu : \n\n\n 1 - List all books\n 2 - List all people \n 3 - Create a person"   
        puts " 4 - Create a book \n 5 - Create a rental \n 6 - List all rental for a given person id"
        puts " 7 - Exit App \n\n\n"
        puts "   Enter option : \n\n"
    end

    def run
        user_input = 0
        
        while user_input != 7
            self.menu
            case user_input
            when 1
                self.list_books
            when 2
                self.list_people
            when 3
                self.create_person
            when 4
                self.create_book
            when 5
                self.create_rental
            when 6
                self.list_rentals_by_id
            when 7
                puts "Thanks for using our library app , hope to see you soon ! "
            else
                puts "enter a valid option, try again. \n\n"
            end
        end
    
    end

end

def main
    app = Library.new
    app.run
end

main()