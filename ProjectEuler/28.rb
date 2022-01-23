#! ruby -Ku
def log(s)
	p Time.now.strftime("%H:%M:%S | " + s)
end
log "start"

MAX_NUMBER = 1001 * 1001
#MAX_NUMBER = 5 * 5

ary = Array.new()
uzu_i = 1
max_num_uzu = 1
max_num_uzu_inner = 0
MAX_NUMBER.times do |i|
	num = i + 1
	# 現在何番目の輪にいるか
	if max_num_uzu < num then
		max_num_uzu_inner = max_num_uzu
		uzu_i += 1
	end
	# 同輪内の最大値
	max_num_uzu = (2 * uzu_i - 3) * 4 + 4 + max_num_uzu_inner
	if num == 1 then
		ary.push num
	elsif (num - max_num_uzu_inner) % (2 * (uzu_i - 1)) == 0 then
		ary.push num + 1
	end
end
p ary
p ary.inject(:+)

#渦の階層と1周の個数
#1
#2渦目 1 * 4 + 4 = 8
#3渦目 3 * 4 + 4 = 16
#4渦目 5 * 4 + 4 = 
#5渦目 7 * 4 + 4 = 
#
#対角の位置にくる数
#
#2渦目 2の倍数 1で引いたとき
#3渦目 4の倍数 9で引いたとき
#4渦目 6の倍数 25で引いたとき
#5渦目 
# 2(n - 1)

log "end"
