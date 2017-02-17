require 'optparse'
require 'yaml'

class Greeter
  def initialize(name = "world")
    @name = name
  end

  def say_hi
    puts "arroo #{@name}"
  end

  def say_bye
    puts "bye #{@name}"
  end
end

greeter = Greeter.new(ARGV[0])
greeter.say_hi
greeter.say_bye


