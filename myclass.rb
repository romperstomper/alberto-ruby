class Person
  @@num_persons = 0
  @shared = []
  attr_accessor :name
  def initialize
    p "num_persons #{@@num_persons}"
    @@num_persons += 1
    @name = 'default_name'
  end
  def self.num_persons
    p @@num_persons
  end
  def self.shared
    @shared
  end
end


class Dad < Person
  @shared = []
end

