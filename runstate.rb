class Mynode
  attr_accessor :run_state
  def initialize
    @run_state = {}
  end
end

m = Mynode.new
p m.run_state
