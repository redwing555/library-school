require_relative '../classes/rental'

class CreateRental
  def initialize(people, rentals, books)
    @people = people
    @rentals = rentals
    @books = books
  end

  def create_rental
    @books.each_with_index do |book, index|
      puts "#{index + 1}) Author: #{book.author}, Title: #{book.title}"
    end
    print 'Select desired book by number: '
    book_number = gets.chomp.to_i


    @people.each_with_index do |person, index|
      puts "#{index + 1}) [#{person.class.name}] Name: #{person.name}, ID:#{person.id}, Age: #{person.age}"
    end
    print 'Enter rentee number here (not ID): '
    person_number = gets.chomp.to_i

    print "\n Date (YYYY/MM/DD) : "
    date = gets.chomp

    rental = Rental.new(person: @people[person_number - 1], book: @books[book_number - 1], date: date)
    @rentals.push(rental)
    puts "\n Rental created successfully! "
  end
end
