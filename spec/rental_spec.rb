require_relative '../rental'

describe Rental do
  context 'when creating a rental' do
    it 'creates a rental with the parameters' do
      date = '2015-12-12'
      book = Book.new('The Lord of the Rings', 'J. R. R. Tolkien')
      person = Person.new('J. R. R. Tolkien', '1970-01-03')
      rental = Rental.new(date, book, person)
      expect(rental).to be_an_instance_of(Rental)
    end
  end
end
