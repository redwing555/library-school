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
    puts 'Welcome to the OOP School Library App!'
    puts "\n"
    puts 'Please choose an option by entering a number: '

    @options = {
      '1': 'List all books',
      '2': 'List all people',
      '3': 'Create a person',
      '4': 'Create a book',
      '5': 'Create a rental',
      '6': 'List all rentals for a given person id',
      '7': 'Exit'
    }

    @options.each do |index, string|
      puts "#{index} - #{string}"
    end
    print "\nEnter option from above list: "
    gets.chomp.to_i
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def homepage
    loop do
      case menu
      when 1
        @books_list.list_books
      when 2
        @people_list.list_people
      when 3
        @choose_person_type.choose_person
      when 4
        @created_books.create_book
      when 5
        @created_rentals.create_rental
      when 6
        @rentals_list.list_rentals_by_id
      when 7
        puts 'Thanks for using our library app , hope to see you soon ! '
        exit
      else
        puts "enter a valid option, try again. \n\n"
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity
  end

  def run
    homepage
  end
end

def main
  app = Library.new
  app.run
end

main
