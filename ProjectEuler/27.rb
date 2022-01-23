#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

MAX_ABS_A = 999
MAX_ABS_B = 999

max_prime_a = nil
max_prime_b = nil
max_prime_num = 0

for a in (MAX_ABS_A * (-1))..MAX_ABS_A do
	for b in (MAX_ABS_B * (-1))..MAX_ABS_B do
		n = 0
		num = calculate_quadratic(n, a, b)
		while num.prime? == true do
			if max_prime_num < num then
				max_prime_a = a
				max_prime_b = b
				max_prime_num = num
			end
			n += 1
			num = calculate_quadratic(n, a, b)
		end
	end
end

print("max prime =", max_prime_num, "\n")
print("a × b =", max_prime_a * max_prime_b, "\n")

p Time.now.strftime("end %H:%M:%S")

def calculate_quadratic (n, a, b)
	return (n ** 2) + (a * n) + b
end


