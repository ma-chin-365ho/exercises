#! ruby -Ku
p Time.now.strftime("start %H:%M:%S")
print ("\n")
require "../class/NumericalSequence"

#最大数
MAX_NUMBER = 600851475143

#10000までの素数のリストを作る
num_seq = NumericalSequence.new
num_seq.max_number = 10000
prime_number_ary = num_seq.create_prime_number

#素因数分解。
num = MAX_NUMBER
print( num , " = ")
prime_number_ary.each do |x|
	while num % x == 0 do 
		num = num / x
		if num == 1 then
			print( x , "\n")
			print( "\n素因数分解完了!!\n" )
		else 
			print( x ," * ")
		end
	end
end

print ("\n")
p Time.now.strftime("end %H:%M:%S")

# ↓ 遅すぎる。。
## 約数生成
#divisor_ary = num_seq.create_divisor
#
#p "約数"
#p divisor_ary
#
#
## 素数生成
#prime_number_ary = num_seq.create_prime_number
#
#p "素数"
#p prime_number_ary
#
#
## 素因数生成
#prime_factor_ary = divisor_ary & prime_number_ary
#
#p "素因数"
#p prime_factor_ary
#p "最大素因数"
#p prime_factor_ary.max

