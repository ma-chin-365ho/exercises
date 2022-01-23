#! ruby -Ku
=begin
モジュール 数学ツール
=end
module MathTool
	# 回文かどうか判定
	def is_palindrome (p)
		str = p.to_s
		
		if str[0, (str.length / 2).floor] == str.reverse[0, (str.length / 2).floor]
			return 0 # falseとnil以外はすべてtrue
		else
			return false
		end
	end

	# コラッツ数列の次の数を取得
	def get_collatz_next_number(num)
		# 偶数の場合
		if num.even? then
			return num / 2
		# 1の場合
		elsif num == 1 then
			return nil
		# 1以外の奇数の場合
		else
			return (num * 3) + 1
		end
	end

	# 階乗の計算
	def calculate_factorial(num)
		factorial = 1
		num.times do |x|
			factorial *= x + 1
		end
		
		return factorial
	end

	# 数字を言葉へ変換
	def convert_number_to_words(num)
		word = ""
		if num < 1_000
			word = convert_number_to_words_three_digit(num)
		elsif num == 1_000
			word = convert_number_to_words_three_digit(num / 1000) + " thousand"
		end
		
		return word
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
	
	# 約数カウント
	# 遅いので、NumericalSequenceクラスに従ってロジックかえる。
#	def count_divisor(num)
#		last_number = (num / 2).floor
#		i = 1
#		cnt = 0
#		while i <= last_number do
#			if num % i == 0 then
#				cnt += 1
#			end
#			i += 1
#		end
#		cnt += 1
#		
#		return cnt
#	end
end
