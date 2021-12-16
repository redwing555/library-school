
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
    puts 'Your library is empty, add some books first !' if @books.empty?

    @books.each do |book|
      puts "  Author: #{book.author}, Title: #{book.title} \n\n"
    end
    puts
  end

  def list_people
    puts 'No person is added yet, add someone!' if @people.empty?

    @people.each do |person|
      person.validate_name
      if person.instance_of?(Teacher)
        puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}, Specialization: #{person.specialization}"
      else
        puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
      end
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
        print 'Has parent permission? [y/n]: '
        permission = gets.chomp
        case permission
        when 'y'
          parent_permission = true
        when 'n'
          parent_permission = false
        else
          puts "Enter a valid option : y or n \n\n"
        end
      end
      @people.push(Student.new(age: age, name: name, parent_permission: parent_permission))
    else
      print 'Specialization: '
      specialization = gets.chomp
      @people.push(Teacher.new(age: age, name: name, specialization: specialization))
    end
    puts "Person Created!  \n\n"
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
    if @books.empty? or @people.empty?
      puts "Create book or person first to rent a book from our collection! \n\n"
      return false
    end

    puts "Select desired book by number \n\n"
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Author: #{book.author}, Title: #{book.title}"
    end
    print 'Enter desired book number here: '
    book_number = gets.chomp.to_i

    if (1...@books.length + 1).to_a.include?(book_number) == false
      puts "Enter valid book number. \n\n"
      return false
    end

    puts "Select desired rentee by number \n\n"
    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
    end
    print 'Enter rentee number here: '
    person_number = gets.chomp.to_i

    if (1...@people.length + 1).to_a.include?(person_number) == false
      puts "Enter valid rentee number. \n\n"
      return false
    end

    print "\n Date (YYYY/MM/DD) : "
    date = gets.chomp

    rental = Rental.new(person: @people[person_number], book: @books[book_number], date: date)
    @rentals.push(rental)
    puts "\n Rental created successfully! "
  end

  def list_rentals_by_id
    puts "Enter rentee's ID : "
    id_input = gets.chomp.to_i

    desired_rentals = @rentals.select { |rental| rental.person.id == id_input }

    if desired_rentals.empty?
      puts 'No book rented for this person.'
    else
      puts 'Rentals: '
      desired_rentals.each do |rental|
        puts "Date : #{rental.date}, Book title: #{rental.book.title}, Author :#{rental.book.author} "
      end
      puts
    end
  end

  def menu
    puts "Welcome to the School library! \n\n"
    puts "School Library Menu : \n\n\n 1 - List all books\n 2 - List all people \n 3 - Create a person"
    puts " 4 - Create a book \n 5 - Create a rental \n 6 - List all rental for a given person id"
    puts " 7 - Exit App \n\n\n"
    print '   Enter option : '
  end

  def run
    user_input = 0

    while user_input != 7
      menu
      user_input = gets.chomp.to_i
      case user_input
      when 1
        list_books
      when 2
        list_people
      when 3
        create_person
      when 4
        create_book
      when 5
        create_rental
      when 6
        list_rentals_by_id
      when 7
        puts 'Thanks for using our library app , hope to see you soon ! '
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

main
