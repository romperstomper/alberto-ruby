class Example
  VALUE = 22
  def initialize
    @var = 2
  end
end
=begin
[4] pry(main)> e.const_get('var')
NoMethodError: undefined method `const_get' for #<Example:0x000001028dc9a0 @var=2>
from (pry):4:in `__pry__'
[5] pry(main)> Example.const_get('var')
NameError: wrong constant name var
from (pry):5:in `const_get'
[6] pry(main)> Example.const_get('VALUE')
=> 22
[7] pry(main)> e.instance_variable_get('@var')
=> 2
[8] pry(main)> e.instance_variable_set('@var', -1)
=> -1
[9] pry(main)> e.instance_variable_get('@var')
=> -1
[10] pry(main)> e.inspect
=> "#<Example:0x000001028dc9a0 @var=-1>"
[11] pry(main)> Example.const_set('VALUE', -2)
(pry):11: warning: already initialized constant Example::VALUE
params.rb:2: warning: previous definition of VALUE was here
=> -2
[12] pry(main)> e.inspect
=> "#<Example:0x000001028dc9a0 @var=-1>"
[13] pry(main)> Example.const_get('VALUE')
=> -2
=end
