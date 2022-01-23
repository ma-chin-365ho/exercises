#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require "./MathExt"

SEARCH_POS = 1_000_000
DIGIT_START = 0
DIGIT_END = 9

digit_ary = Array.new
for i in DIGIT_START..DIGIT_END do
	digit_ary.push i
end

ans_ary = Array.new
now_pos = SEARCH_POS
digit_ary_len = digit_ary.length
digit_ary_len.times do |i|
	patern_count =  (digit_ary.length - 1).factorial
	j = 0
	now_digit = digit_ary[j]
	while now_pos > patern_count do
		now_pos -= patern_count
		j += 1
		now_digit = digit_ary[j]
	end
	ans_ary.push now_digit
	digit_ary.delete(now_digit)
end
ans_ary = ans_ary + digit_ary
p ans_ary.join
p Time.now.strftime("end %H:%M:%S")

