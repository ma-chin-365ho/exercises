#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require "./MathExt"

MAX_DENOMINATOR = 999

max_digit = 0
max_digit_denominator = 0
(MAX_DENOMINATOR - 1).times do |x|
	denominator =  x + 2
	ir = Irrational.new(1, denominator)
	s = ir.to_s_decimal
	
	# 循環部分の桁数を算出
	start_index = s.index("(")
	end_index = s.index(")")
	
	if start_index != nil and end_index != nil then
		now_digit = end_index - start_index - 1
		if max_digit < now_digit then
			max_digit_denominator = denominator
			max_digit = now_digit
		end
	end
end

p max_digit_denominator
p max_digit

p Time.now.strftime("end %H:%M:%S")

