require './Person'

class Student < Person
  attr_reader :classroom
  attr_accessor :type

  def initialize(age, name, parents_permission)
    super(age, name, parents_permission: parents_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
