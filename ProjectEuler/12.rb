#! ruby -Ku
p Time.now.strftime("%H:%M:%S start")

MAX_NUMBER =100_000_000
MAX_DIVISOR_COUNT = 500

require("../class/NumericalSequence")

print(Time.now.strftime("%H:%M:%S "), MAX_NUMBER,"までの三角数数列 取得開始\n")
num_seq = NumericalSequence.new
num_seq.max_number = MAX_NUMBER
num_seq.create_triangle_number
print(Time.now.strftime("%H:%M:%S "), MAX_NUMBER,"までの三角数数列 取得終了\n")

print(Time.now.strftime("%H:%M:%S "), MAX_DIVISOR_COUNT,"個を超える約数を持つ初めての三角数検索開始\n")
flg_ok = false
num_seq2 = NumericalSequence.new
num_seq.terms.each do |x|
	print(Time.now.strftime("%H:%M:%S "), x,"の約数を生成\n")
	num_seq2.max_number = x
	num_seq2.create_divisor
#	p num_seq2.terms
	if num_seq2.terms.length > MAX_DIVISOR_COUNT then
		flg_ok = 0
		break
	end
end
print(Time.now.strftime("%H:%M:%S "), MAX_DIVISOR_COUNT,"個を超える約数を持つ初めての三角数検索終了\n")

if flg_ok != false then
	print("answer = ",num_seq2.max_number,"\n")
	print("detail = ",num_seq2.terms,"\n")
else
	print("miss...\n")
end

p Time.now.strftime("%H:%M:%S end")

