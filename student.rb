require "./Person"

class Student < Person
  def initialize(age, classroom, name: "Unknown", parents_permission: true)
    super(age, name: name, parents_permission: parents_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
