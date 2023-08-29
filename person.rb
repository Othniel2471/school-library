require './nameable'
require './decorator'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  def initialize(age, name = 'Unknown', parents_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parents_permission = parents_permission
  end

  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    @parent_permission || of_age?
  end

  def correct_name
    @name
  end

  private

  def of_age
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
