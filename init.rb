module Person
  class User
  end
end

class Init
  def initialize(name)
    cl = Person.const_get(name).new
  end
end
