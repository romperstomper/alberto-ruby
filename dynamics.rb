class Example
  def method_missing(sym, *args, &block)
    define_method(sym, *args, &block)
  end

  def define_method(sym) 
    puts "calling the method #{sym} with #{args}"
  end
end

