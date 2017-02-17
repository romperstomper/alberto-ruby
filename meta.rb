class Example
  def name
    'my name in the original class'
  end
end

$some_example = Example.new

class User
end

class Example
  def name
    'changed name in myexample'
  end
end


