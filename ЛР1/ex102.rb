num = 1
den = 1
for d in 10..100 do
    for n in 10..d do
        n0 = n % 10
        n1 = n / 10
        d0 = d % 10
        d1 = d / 10
        if (n1 == d0 and n0 * d == n * d1) or (n0 == d1 and n1 * d == n * d0) then
            num = num * n
            den = den * d
        end
    end
end
g = num.gcd den
s = den / g
puts s
gets