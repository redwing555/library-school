require_relative '../lib/classes/student'
require_relative '../lib/classes/book'
require_relative '../lib/classes/rental'
require 'json'


describe Rental do
    context 'Instance of rental class' do
        it 'Should instantiate the rental class correctly' do
            book1 = Book.new(title:'The lord of the rings' , author:'Tolkien')
            person1 = Person.new(age: 15, name:'Bob', parent_permission: true)
    
            rental1 = Rental.new(date:'2020/20/20',person:person1,book:book1)
    
            expect(person1.rentals[0]).to eq rental1
            expect(book1.rentals[0]).to eq rental1
        end
    
        it 'Json state values should equal class instance values' do
            book1 = Book.new(title:'The lord of the rings' , author:'Tolkien')
            student1 = Student.new(age: 15, name:'Bob', parent_permission: true)
            rental1 = Rental.new(date:'2020/20/20',person:student1, book:book1)
            
            book_json = book1.to_json
            student_json = student1.to_json
    
    
            expect(JSON.parse(rental1.to_json)["date"]).to eq rental1.date
            expect(JSON.parse(rental1.to_json)["person"]).to eq student_json
            expect(JSON.parse(rental1.to_json)["book"]).to eq book_json
        end
    end    
end

