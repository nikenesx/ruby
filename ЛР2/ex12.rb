f = File.new("lines.txt", "r:UTF-8")
lines = f.readlines
lines = lines.sort_by {|x| x.length}
puts lines
