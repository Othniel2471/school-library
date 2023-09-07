require './person'

class Student < Person
  attr_reader :classroom, :id
  attr_accessor :type

  def initialize(age, name, parents_permission)
    super(age, name, parents_permission: parents_permission)
    @classroom = classroom
    @type = 'Student'
  end

  def getting_id
    @id
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
