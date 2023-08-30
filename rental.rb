class Rental
  attr_accessor :date

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals.push(self)
    person.rentals.push(self)
  end

  def book(book)
    @book = book
    Book.add_rental(self)
  end

  def person(person)
    @person = person
    Person.add_rental(self)
  end
end
