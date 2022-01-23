#! ruby -Ku
=begin
MathExt.rb

Ruby 数学処理用拡張ライブラリ
=end

# 整数クラスの拡張
class Integer
	# 階乗
	def factorial
		product = 1
		self.times do |x|
			product *= x + 1
		end
		
		return product
	end
	
	# 約数
	def divisor
		return create_divisor(self)
	end
	
	# 約数(自分自身は除く)の合計と自分自身を比較する
	# 
	# <return>
	#  1:過剰数 (約数合計 > 自分自身)
	#  0:完全数 (約数合計 = 自分自身)
	# -1:不足数 (約数合計 < 自分自身)
	def compare_divisor_total
		if self < 1 then
			return nil
		end
		
		sum_divisor = self.divisor.inject(:+)
		sum_divisor -= self
		if sum_divisor > self then
			return 1
		elsif sum_divisor == self then
			return 0
		else
			return -1
		end
	end
	
	# 友愛数
	def amicable
		amicable_number = nil
		
		if self < 1 then
			return amicable_number
		end
		
		divisor_ary = self.divisor
		divisor_ary.pop
		unless divisor_ary.empty? then
			partner_number = divisor_ary.inject(:+)
			if partner_number != self then
				partner_divisor_ary = partner_number.divisor
				partner_divisor_ary.pop
				if partner_divisor_ary.inject(:+) == self then
					amicable_number = partner_number
				end
			end
		end
		return amicable_number
	end
	
	#回文数かどうか
	def palindrome?
		str = self.to_s
		if str[0, (str.length / 2).floor] == str.reverse[0, (str.length / 2).floor]
			return true
		else
			return false
		end
	end
	
	#言葉[イギリス英語]に変換 (1000までなら変換可能。)
	def words
		str = ""
		if self < 1_000
			str = convert_number_to_words_three_digit(self)
		elsif self == 1_000
			str = convert_number_to_words_three_digit(self / 1000) + " thousand"
		end
		
		return str
	end
	
	# 素数かどうか
	# AKS素数判定法で算出
	def prime?
		p "まだ"
	end
	
	# 累乗数かどうか
	def perfect_power?
	end
end

# 無理数クラス
class Irrational
	attr_accessor :numerator, :denominator
	
	# コンストラクタ
	# 
	# <param>
	# numerator:分子 [Integer]
	# denominator:分母 [Integer]
	def initialize(numerator,denominator)
		@numerator = numerator
		@denominator = denominator
	end
	
	# 小数の形の文字列に変換して返却
	# 
	# 循環小数の場合以下の形式で文字列を返却する
	# 1.45(32)    ＊ (32) = 323232…
	def to_s_decimal
		s = ""
		quotient = @numerator / @denominator
		reminder = @numerator % @denominator
		if reminder != 0 then
			s += quotient.to_s + "."
			quotient_ary = Array.new()
			reminder_ary = Array.new()
			
			while true do
				numerator_next = reminder * 10
				quotient = numerator_next / @denominator
				reminder = numerator_next % @denominator
				
				if reminder == 0 then
					quotient_ary.push quotient
					s += quotient_ary.join
					break
				else
					idx = reminder_ary.index {|x| x == reminder}
					
					if idx != nil then
						i = 0
						if idx != 0 then
							while i < idx do
								s += quotient_ary[i].to_s
								i += 1
							end
						end
						cycle_start_idx = i
						if quotient_ary[cycle_start_idx] != quotient then
							s += quotient_ary[cycle_start_idx].to_s
							i += 1
						end
						s += "("
						end_i = quotient_ary.length
						while i < end_i do
							s += quotient_ary[i].to_s
							i += 1
						end
						if quotient_ary[cycle_start_idx] != quotient then
							s += quotient.to_s
						end
						s += ")"
						
						break
					end
					quotient_ary.push quotient
					reminder_ary.push reminder
				end
			end
		else
			s += quotient.to_s
		end
		
		return s
	end
	
end

# 約数生成
def create_divisor (num)
	divisor_ary = Array.new
	partner_divisor_ary = Array.new
	
	if num < 1 then
		return nil
	elsif num == 1 then
		divisor_ary.push 1
	else
		i = 1
		partner_divisor = 0
		until i == partner_divisor do
			if num % i == 0 then
				divisor_ary.push i
				partner_divisor = num / i
				if partner_divisor != i then
					partner_divisor_ary.unshift partner_divisor
				else
					break
				end
			end
			i += 1
		end
		divisor_ary += partner_divisor_ary
	end
	
	return divisor_ary
end

# フィボナッチ数列の生成
#
# <param>
# term1:初項
# term2:2番目の項
# max_term:最大値
def create_fibonacci_sequence( term1, term2, max_term)
	#フィボナッチ数列の作成
	fibo_ary = Array.new
	fibo_ary.push term1
	fibo_ary.push term2
	
	new_num = 0
	i = 2
	new_num = fibo_ary[i-1] + fibo_ary[i-2]
	while new_num <= max_term do 
		fibo_ary.push new_num
		i += 1
		new_num = fibo_ary[i-1] + fibo_ary[i-2]
	end
	
	return fibo_ary
end


# 1桁の数字を言葉へ変換
def convert_number_to_words_one_digit (num)
	one_digit_number = num.to_i % 10
	word = ""
	case one_digit_number
	when 0 then
		word = "zero"
	when 1 then
		word = "one"
	when 2 then
		word = "two"
	when 3 then
		word = "three"
	when 4 then
		word = "four"
	when 5 then
		word = "five"
	when 6 then
		word = "six"
	when 7 then
		word = "seven"
	when 8 then
		word = "eight"
	when 9 then
		word = "nine"
	end
	
	return word
end

# 2桁の数字を言葉へ変換
def convert_number_to_words_two_digit(num)
	two_digit_number = num.to_i % 100
	word = ""
	
	if two_digit_number < 0 then
		return word
	elsif two_digit_number < 10 then
		word = convert_number_to_words_one_digit(two_digit_number)
	elsif two_digit_number < 20 then
		case two_digit_number
		when 10 then
			word = "ten"
		when 11 then
			word = "eleven"
		when 12 then
			word = "twelve"
		when 13 then
			word = "thirteen"
		when 14 then
			word = "fourteen"
		when 15 then
			word = "fifteen"
		when 16 then
			word = "sixteen"
		when 17 then
			word = "seventeen"
		when 18 then
			word = "eighteen"
		when 19 then
			word = "nineteen"
		end
	else
		case two_digit_number.to_s[0,1].to_i
		when 2 then
			word = "twenty-"
		when 3 then 
			word = "thirty-"
		when 4 then 
			word = "forty-"
		when 5 then 
			word = "fifty-"
		when 6 then 
			word = "sixty-"
		when 7 then 
			word = "seventy-"
		when 8 then 
			word = "eighty-"
		when 9 then 
			word = "ninety-"
		end
		word = word + convert_number_to_words_one_digit(two_digit_number)
		word.sub!("-zero","")
	end
	
	return word
end

# 3桁の数字を言葉へ変換
def convert_number_to_words_three_digit(num)
	three_digit_number = num.to_i % 1_000
	word = ""
	if three_digit_number < 0 then
		return word
	end
	if three_digit_number < 100 then
		word = convert_number_to_words_two_digit(three_digit_number)
	else
		word = convert_number_to_words_one_digit(three_digit_number / 100) + " hundred and " + convert_number_to_words_two_digit(three_digit_number)
	end
	word.sub!(" and zero","")
	
	return word
end
