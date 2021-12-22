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

  def to_json(*_args)
    JSON.dump({
                date: @date,
                person: @person.to_json,
                book: @book.to_json
              })
  end
end
