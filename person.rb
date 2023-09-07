require './nameable'
require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :parents_permission, :name, :age
  attr_reader :id, :rentals

  def initialize(age, name = 'Unknown', parents_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parents_permission = parents_permission
    @rentals = []
  end

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age
    @age >= 18
  end
end
