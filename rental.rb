require_relative './person'
require_relative './book'
class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person:, book:, date:)
    @date = date

    @person = person
    puts person.nil?
    person.rentals << self

    @book = book
    book.rentals << self
  end
end





