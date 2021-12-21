require_relative './person'
require_relative './book'
class Rental
  attr_accessor :date, :person
  attr_reader :book

  def initialize(person:, book:, date:)
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end
end
