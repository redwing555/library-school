class Rental
    attr_accessor :date
    attr_reader :person, :book

    def initialize(date:, person:, book:)
        @date = date
        @person = person
        @book = book
    end

    person.rentals.push(self)
    book.rentals.push(self)
end