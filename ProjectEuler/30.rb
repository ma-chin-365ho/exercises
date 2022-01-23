#! ruby -Ku
def log(s)
	p Time.now.strftime("%H:%M:%S | " + s)
end

log "start"

#max_number = 10000
#POWER = 4
POWER = 5

disit_count = 1
max_number = 0
loop do
	max_number += 9 ** POWER
	if ("9" * disit_count).to_i >= max_number then
		break
	end
	disit_count += 1
end

ary = Array.new()
# 1は除外する。
(max_number - 1).times do |x|
	num = x + 2
	w_num = num
	sum_disit = 0
	until w_num == 0
		disit = w_num % 10
		sum_disit += disit ** POWER
		w_num /= 10
	end
	if num == sum_disit then
		ary.push num
	end
end

p ary
p ary.inject(:+)
log "end"

