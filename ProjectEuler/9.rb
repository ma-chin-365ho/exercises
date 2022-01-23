#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

MAX_NUMBER = 1000
SUM_NUMBER = 1000

#ピタゴラスの定理を満たす3数を探す

#a <= b <= MAX_NUMBERとなる自然数a,bセットの配列を作る。
ab_ary = Array.new

MAX_NUMBER.times do |i|
	(MAX_NUMBER - i).times do |j|
		ary = Array.new
		ary.push i + 1
		ary.push j + i + 1
		
		ab_ary.push ary
	end
end

#a^2 + b^2 = c^2 となる、自然数abcのセットの配列を作る。
abc_ary = Array.new
ab_ary.each do |x|
	num_c = Math.sqrt((x[0] ** 2) + (x[1] ** 2))

	# cが自然数の場合
	if num_c == num_c.floor then
		x.push num_c.to_i
		abc_ary.push x
	end
end

#和がSUM_NUMBERとなる3数セットを抽出
abc_ary.select! { |x| x[0] + x[1] + x[2] == SUM_NUMBER }

#積を算出
flg_ok = false
i = 0
abc_ary.each do |x|
	i += 1
	flg_ok = 0
	
	print("answer",i,"\n")
	print("a = " , x[0], "\n")
	print("b = " , x[1], "\n")
	print("c = " , x[2], "\n")
	print("abc = " , x[0] * x[1] * x[2], "\n")
	print("\n")
end

if flg_ok == false then
	p "miss."
end

p Time.now.strftime("end %H:%M:%S")

