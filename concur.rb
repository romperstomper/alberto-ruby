require 'thread'

result =0
mutex = Mutex.new
queue = Queue.new
queue2 = Queue.new

t1 = Thread.new do
  20.times do
    sleep 0.2 # keeping the sleep outside the critical region
    # introduces variation between the threads
    mutex.synchronize do
      result = result + 1
      puts "thread 1: #{result}"
    end
    queue << 'new value'
    queue2.pop
  end
end

t2 = Thread.new do
  30.times do
    begin
      queue.pop
    rescue  => e
      puts "Error #{e.message}"
    end
    mutex.synchronize do
      puts "thread 2: #{result}"
    end
    queue2 << 'value printed'
  end
end

mutex.synchronize do
  puts "outside the threads: #{result}"
end

t1.join
t2.join

