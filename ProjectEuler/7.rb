#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require("../class/NumericalSequence")

MAX_NUMBER = 110000 # 多くしすぎると処理が終わらないので、徐々に大きくしていく。
MAX_INDEX = 10001

print(MAX_INDEX,"番目の素数を探す...","\n")
print("\n")

# 素数生成
num_seq = NumericalSequence.new
num_seq.max_number = MAX_NUMBER
num_seq.create_prime_number

# MAX_INDEX番目の素数検索
prime_number = 1
flg_ok = false
i = 0
num_seq.terms.each do |x| 
	i += 1
	prime_number = x
	if i == MAX_INDEX then
		flg_ok = 0
		break
	end
end

if flg_ok != false then
	p "成功"
	print(i," 番目は ",prime_number,"\n")
else
	p "失敗"
	print(i,"番目まで検索。","\n")
end

p Time.now.strftime("end %H:%M:%S")
