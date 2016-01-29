require_relative "./stacker"

size = 0
check_size = 0
check_size_inc = 10
max_size = 600
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
