require 'date'
class Rental
    attr_accessor :date
    attr_reader :person, :book

    def initialize(date: Datetime.now(), person:, book:)
        @date = date
        @person = person
        @book = book

        person.rentals.push(self)
        book.rentals.push(self)
    end
end