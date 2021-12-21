require_relative './student'
require_relative './person'
require_relative './methods/create_book'
require_relative './methods/create_student'
require_relative './methods/create_teacher'
require_relative './methods/create_rental'
require_relative './methods/person_choice'
require_relative './methods/list_books'
require_relative './teacher'

class Library
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_people
    puts "\n\nNo person is added yet, add someone!" if @people.empty?

    @people.each do |person|
      person.validate_name
      puts "[#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}\n"
    end
  end

  
  def list_rentals_by_id
    print "Enter rentee's ID : "
    id_input = gets.chomp.to_i

    desired_rentals = @rentals.select { |rental| rental.person.id == id_input }

    if desired_rentals.empty?
      puts 'No book rented for this person.'
    else
      puts 'Rentals: '
      desired_rentals.each do |rental|
        puts "Date : #{rental.date}, Title: #{rental.book.title}, Author :#{rental.book.author}."
      end
      puts
    end
  end

  def menu
    puts "\n\nWelcome to the School library!\n\n"
    puts "School Library Menu : \n\n\n 1 - List all books\n 2 - List all people \n 3 - Create a person"
    puts " 4 - Create a book \n 5 - Create a rental \n 6 - List all rental for a given person id"
    puts " 7 - Exit App \n\n\n"
    print '   Enter option : '
  end
  # rubocop:disable Metrics/CyclomaticComplexity

  def homepage
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
      exit
    else
      puts "enter a valid option, try again. \n\n"
    end
  end

  def run
    user_input = 0

    homepage while user_input != 7
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
def main
  app = Library.new
  app.run
end

main
