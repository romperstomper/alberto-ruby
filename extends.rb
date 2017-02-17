module Person
  def name
     p 'hello'
  end
end

class User
  include Person
end

module Person
  def named
    p 'Person'
  end
end

class User
  extend Person
end

User.name
User.named
