require './Person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name: 'Unknown', parents_permission: true)
    super(age, name: name, parents_permission: parents_permission)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
