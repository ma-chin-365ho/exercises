#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

MAX_NUMBER = 10_000

require "../class/NumericalSequence"
num_seq = NumericalSequence.new
amicable_number_ary = Array.new

MAX_NUMBER.times do |x|
	num = x + 1
	num_seq.max_number = num
	num_seq.create_divisor_amicable
	amicable_number = num_seq.amicable_number
	if amicable_number != nil then
		amicable_number_ary.push num
		amicable_number_ary.push amicable_number
	end
end

amicable_number_ary.uniq!
amicable_number_ary.reject! {|x| x > MAX_NUMBER}
p amicable_number_ary
p amicable_number_ary.inject(:+)

p Time.now.strftime("end %H:%M:%S")

