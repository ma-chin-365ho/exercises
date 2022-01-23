#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

digits = 2 ** 1000

sum = 0
digits.to_s.split(//).each do |c|
	sum += c.to_i
end
p sum

p Time.now.strftime("end %H:%M:%S")
