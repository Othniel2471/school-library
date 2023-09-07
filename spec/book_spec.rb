require_relative '../book'
require_relative '../rental'
require_relative '../person'

describe Book do
  before do
    @book = Book.new('The Martian', 'Andy Weir')
  end

  it 'has a title' do
    expect(@book.title).to eq('The Martian')
  end

  it 'has an author' do
    expect(@book.author).to eq('Andy Weir')
  end

  it 'can have rentals' do
    expect(@book.rentals).to eq([])
  end

  it 'can add a rental' do
    person = Person.new('Mark Watney')
    rental = @book.add_rental('2015-02-10', person)
    expect(rental.book).to eq(@book)
    expect(rental.person).to eq(person)
    expect(rental.date).to eq('2015-02-10')
    expect(@book.rentals).to eq([rental])
  end
end
