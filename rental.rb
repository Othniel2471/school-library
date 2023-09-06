class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person

    book.rentals.push(self) if book
    person.rentals.push(self) if person
  end
end
