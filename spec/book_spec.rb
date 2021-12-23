require_relative '../lib/classes/book'

describe Book do
    context 'testing a book class' do
        it 'should create new book instance correctly' do
            book = Book.new(title:'Lord of the rings', author:'Tolkien')
            expect(book.title).to eq 'Lord of the rings'
            expect(book.author).to eq 'Tolkien'
        end
    end
end