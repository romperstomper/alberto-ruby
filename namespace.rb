module Person
  def name
   p 'hello'
  end

  def self.included(base)
    p "#{base} included #{self}"
  end


