class MyError < RuntimeError; end

class Example
  def method_missing(sym, *args, &block)
    p "method missing! trying to run #{sym} with #{args}"
    raise MyError, "method #{sym} not found"
  end
end
