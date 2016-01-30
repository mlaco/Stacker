require_relative "./stacker"

size = 0
check_size = 0
check_size_inc = 1
max_size = 50
data = []

s = Stacker.new

ti = Time.now
while size < max_size do
  size = s.s.size
  if size >= check_size
    check_size += check_size_inc
    datum = s.d_top(size) / 2
    p "height: #{size}, d: #{datum}"
    data << datum
  end
  s.add_dmno
end

tf = Time.now
p "Took #{tf - ti} seconds"
puts "\r" * 5

w = 6
space = " "
dmno = "*"*2*w
data.each do |datum|
  puts space*((datum*w).round) + dmno + "\r"
end
