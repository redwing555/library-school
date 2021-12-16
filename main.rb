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
            puts "  Author: #{book.author}, Title: #{book.title} \n\n"
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
        print 'Do you want to create a student(1) or a teacher(2)? [Input the number]: '
        input = gets.chomp.to_i
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        if input == 1
            parent_permission = nil
            while parent_permission.nil?
                print 'Has parent permission? [Y/N]: '
                permission = gets.chomp
                case permission
                when 'Y'
                    parent_permission = true
                when 'N'
                    parent_permission = false
                else
                    puts "Enter a valid option : Y or N \n\n"
                end
            end
            @people.push(Student.new(age: age, name: name,parent_permission: parent_permission ))
        else
            print 'Specialization: '
            specialization = gets.chomp
            @people.push(Teacher.new(Student.new(age: age, name: name,specialization: specialization )))
        end
        puts "Person Created! \n\n"
    end

    def create_book
        print 'Title: '
        title = gets.chomp
        print 'Author: '
        author = gets.chomp

        @books.push(Book.new(title: title, author: author))
        puts 'Book successfully created! \n\n'

    end

    def create_rental

    end

    def list_rentals_by_id
    end

    def menu
        puts "Welcome to the School library! \n\n"
        puts "School Library Menu : \n\n\n 1 - List all books\n 2 - List all people \n 3 - Create a person"   
        puts " 4 - Create a book \n 5 - Create a rental \n 6 - List all rental for a given person id"
        puts " 7 - Exit App \n\n\n"
        print "   Enter option : "
    end

    def run
        user_input = 0
        
        while user_input != 7
            self.menu
            user_input = gets.chomp.to_i
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