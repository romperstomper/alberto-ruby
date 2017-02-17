class Example
  attr_accessor :name
  def do(action)
    name.send(action)
  end
end

  
class API
  def request(args)
    fail unless args.is_a?(Hash)
    fail unless args.key?(:verb)
  def request(verb: :get, opts: {})
    HTTParty.send(verb, opts)
  end
end

API.new.request(verb: :post)
API.new.request(verb: :get, opts: {ssl: false})
