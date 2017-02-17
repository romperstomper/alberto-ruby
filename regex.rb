#string substitution
"I am gary".gsub('gary', 'jack')
#puts "I am gary".gsub(/gary/i, 'Jack')
x = "here are some numbers 5556000-2"
pat = /\d{7}-(\d)/
m = pat.match(x)
puts m
puts m[1]
puts "the phone is #{m} and the ext is #{m[1]}"
lines = ['connection from ip 127.0.0.1', 'connection from 0.0.0.0', 'blah']0.0.0.0'
ip = /(\d+)

#solution
ippat = /(\d+)\.(\d+)\.(\d+)\.(\d+)/
ips = lines.map { |line| ippat.match(line)[0] if ippat.match(line)}.compact
