#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require "../class/NumericalSequence"

MAX_NUMBER = 28_123

num_seq = NumericalSequence.new

print(Time.now.strftime("start %H:%M:%S "),"自然数の配列\n")
natural_number_ary = Array.new
MAX_NUMBER.times do |x|
	natural_number_ary.push x + 1
end

print(Time.now.strftime("start %H:%M:%S "),"過剰数数列の生成\n")
abundant_number_ary = Array.new
MAX_NUMBER.times do |x|
	num = x + 1
	
	num_seq.max_number = num
	num_seq.create_divisor
	
	if num_seq.is_abundant_number then
		abundant_number_ary.push num
	end
end

print(Time.now.strftime("start %H:%M:%S "),"2つの過剰数の合計で表現できる数の配列を作成\n")
sum_two_abundant_number_ary = Array.new
abundant_number_ary.each do |x|
	abundant_number_ary.each do |y|
		sum_two_abundant_number_ary.push x + y
	end
end

print(Time.now.strftime("start %H:%M:%S "),"答え\n")
p (natural_number_ary - sum_two_abundant_number_ary).inject(:+)

p Time.now.strftime("end %H:%M:%S")

