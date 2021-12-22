require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/classroom'
require_relative '../classes/student'
require_relative '../classes/rental'
require_relative '../classes/teacher'
require 'json'

module Storage
    def from_file(people: nil, books: nil, rentals: nil)
        from_file_to_books(books) if books
        from_file_to_people(people) if people
        from_file_to_rentals(rentals) if rentals
    end

    def from_books_to_file
        books_json = []
        @books.each do |book|
          books_json.push(book.to_json)
        end
    
        books_json = JSON.dump({
                                 books: books_json
                               })
    
        File.write('books.json', books_json)
    end

    def from_file_to_books(books)
        book_data = JSON.parse(books)["books"]
    
        return if book_data == []
        
        book_data.each do |object|
          file = JSON.parse(object)
          created_book = Book.new(title: file['title'],author: file['author'])
          @books.push(created_book) if file
        end
    end

    def from_file_to_people(people)
        people_data = JSON.parse(people)["people"]
        return if people_data == []

        people_data.each do |object|
            file = JSON.parse(object)

            student = Student.new(age: file['age'], name: file['name'], parent_permission: file['parent_permission'])
            teacher = Teacher.new(age: file['age'], name: file['name'], specialization: file['specialization'])

            if file['classname'] == 'Student' && file
            @people.push(student) 
            else
            @people.push(teacher)  
            end
        end
    end

    def from_people_to_file
        people_json = []
        @people.each do |person|
            people_json.push(person.to_json)
        end

        people_json = JSON.dump({
                                    people: people_json
                                })

        File.write('people.json', people_json)
    end
    
    def from_rentals_to_file
        rentals_json = []
        @rentals.each do |rental|
        rentals_json.push(rental.to_json)
        end
    
        rentals_json = JSON.dump({
                                   rentals: rentals_json
                                 })
        File.write('rentals.json',rentals_json)
    end

end


