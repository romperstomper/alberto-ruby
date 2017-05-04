require 'timeout'
class QueueWithTimeout
  def initialize
    @mutex = Mutex.new
    @queue = []
    @recieved = ConditionVariable.new
  end
 
  def <<(x)
    @mutex.synchronize do
      @queue << x
      @recieved.signal
    end
  end
 
  def pop(non_block = false)
    pop_with_timeout(non_block ? 0 : nil)
  end
 
  def pop_with_timeout(timeout = nil)
    @mutex.synchronize do
      if @queue.empty?
        @recieved.wait(@mutex, timeout) if timeout != 0
        #if we're still empty after the timeout, raise exception
        raise ThreadError, "queue empty" if @queue.empty?
      end
      @queue.shift
    end
  end
end

queue = QueueWithTimeout.new

t1 = Thread.new do
  20.times do |count|
    puts "thread 1: #{count}"
    queue << count
  end
end

t2 = Thread.new do
  30.times do
    value = nil
    begin
      value = queue.pop_with_timeout(3)
    rescue => e
    end
    puts "thread 2 value #{Time.now.utc}"
  end
end
t1.join
t2.join
puts 'at the end'

Timeout.timeout(30) do
  curl 'http://google.com'
end
