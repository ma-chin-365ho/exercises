#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")

require "../class/NumericalSequence"

# 1からMAX_NUMBERまでの数を素因数分解して、
# 必要最小限の素数をかけていく。2がXつ、3がXつ、、、、

#MAX_NUMBER = 10
MAX_NUMBER = 20

# 自然数の配列作成
natural_number_ary = Array.new
MAX_NUMBER.times {|x| natural_number_ary.push (x + 1)}
natural_number_ary.shift # 1ははずす(素数でないため)

# 素数の配列作成
num_seq = NumericalSequence.new
num_seq.max_number = MAX_NUMBER
prime_number_ary = num_seq.create_prime_number

# 素因数(重複あり)の配列の配列作成
# 自然数を順番に素数で割っていく。
prime_factor_aryary = Array.new
natural_number_ary.each do |nnum|
	prime_factor_ary = Array.new

	prime_number_ary.each do |pnum|
		i = 1
		while nnum % pnum == 0 do
			# ↓で計算しやすいように何個目の同じ素因数かという情報も追加 ("|"以降)
			prime_factor_ary.push pnum.to_s + "|" + i.to_s
			nnum = nnum / pnum
			i += 1
		end
		# 割り切れた場合終了
		if nnum == 1 then
			break
		end
	end

	prime_factor_aryary.push prime_factor_ary
end

p "素因数"
p prime_factor_aryary

# 素因数を重複なしにまとめる
ary = Array.new
prime_factor_aryary.each do |x|
	ary = ary | x
end

p "素因数（重複なし）"
p ary
p

# 答えを算出
answer = 1
ary.each do |x|
	answer = answer * x.split("|")[0].to_i
end

print("答え ", answer, "\n")

p Time.now.strftime("end %H:%M:%S")

