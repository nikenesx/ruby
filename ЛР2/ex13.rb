f = File.new("lines.txt", "r:UTF-8")
lines = f.readlines
lines = lines.sort_by {|x| x.split(" ").count }
puts lines

