# frozen_string_literal: true

require './Person'

class Teacher < Person
  attr_reader :type

  def initialize(age, specialization, name = 'Unknown', parents_permission: true)
    super(age, name, parents_permission: parents_permission)
    @specialization = specialization
    @type = 'Teacher'
  end

  def can_use_services?
    true
  end
end
