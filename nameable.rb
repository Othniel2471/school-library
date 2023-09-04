# frozen_string_literal: true

class Nameable
  def correct_name
    raise NotImplementedError, 'You must implement the correct_name method'
  end
end
