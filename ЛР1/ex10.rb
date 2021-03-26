file = File.new("bignum_ex91.txt","r:UTF-8")
inp = file.readlines
sum = 0
for i in inp do
	sum = sum + i.to_i
end
puts sum.to_s.slice(0..9)
gets