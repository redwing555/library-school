require_relative './methods/create_book'
require_relative './methods/create_student'
require_relative './methods/create_teacher'
require_relative './methods/create_rental'
require_relative './methods/person_choice'
require_relative './methods/list_books'
require_relative './methods/list_people'
require_relative './methods/list_rentals_id'


class Library
  def initialize
    @books = []
    @created_books = CreateBook.new(@books)
    @books_list = BookList.new(@books)

    @people = []
    @people_list = PeopleList.new(@people)
    @choose_person_type = PersonType.new(@people)

    @rentals = []
    @created_rentals = CreateRental.new(@people, @rentals, @books)
    @rentals_list = RentalList.new(@rentals)
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
