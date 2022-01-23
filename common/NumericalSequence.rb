#! ruby -Ku
=begin
数列クラス

<propaty>
terms
max_number

<method>
create_divisor:約数生成
create_prime_number:素数生成
create_triangle_number:三角数生成
create_collatz:コラッツ数列生成

=end
class NumericalSequence

	attr_accessor :terms # 数列の項の配列
	attr_accessor :max_number # 数列の最大数
	attr_accessor :start_number # 数列の開始数
	attr_reader :amicable_number # 友愛数
	
	# 約数生成
	def create_divisor
		@terms = Array.new
		partner_divisor_ary = Array.new

		# |20140312 edit start| * 総当たり方式は遅いので変更
#		last_number = (@max_number / 2).floor
#		i = 1
#		while i <= last_number do
#			if @max_number % i == 0 then
#				@terms.push i
#			end
#			i += 1
#		end
#		@terms.push @max_number
		if @max_number == 1 then
			@terms.push 1
		else
			i = 1
			partner_divisor = 0
			until i == partner_divisor do
				if @max_number % i == 0 then
					@terms.push i
					partner_divisor = @max_number / i
					if partner_divisor != i then
						partner_divisor_ary.unshift partner_divisor
					else
						break
					end
				end
				i += 1
			end
			@terms += partner_divisor_ary
		end
		# |20140312 edit start| * 総当たり方式は遅いので変更
		
		return @terms
	end
	
	# 約数生成(友愛数がある場合セットする)
	def create_divisor_amicable
		@amicable_number = nil
		
		divisor_ary = self.create_divisor
		sv_max_number = @max_number
		sv_terms = @terms
		
		divisor_ary.pop
		unless divisor_ary.empty? then
			partner_number = divisor_ary.inject(:+)
			if partner_number != sv_max_number then
				@max_number = partner_number
				partner_divisor_ary = self.create_divisor

				partner_divisor_ary.pop
				if partner_divisor_ary.inject(:+) == sv_max_number then
					@amicable_number = partner_number
				end
			end
		end

		# 約数生成時に上書きされるので、もとに戻す
		@max_number = sv_max_number
		@terms = sv_terms
		return @terms
	end

	# 過剰数かどうか
	def is_abundant_number
		sum_divisor = @terms.inject(:+)
		sum_divisor -= @max_number
		
		if sum_divisor > @max_number then
			return true
		else
			return false
		end
	end
	
	# 素数生成
	# エラトステネスのふるいのアルゴリズムを使用
	def create_prime_number
		@terms = Array.new
		# 自然数の配列
		@max_number.times {|x| @terms.push x + 1}
		@terms.shift # 1は素数ではないのではずず

		# ふるいにかける
		last_number = Math.sqrt(@max_number).floor
		i = 0
		current_number = @terms[i]
		while current_number <= last_number do
			# |debug| print(Time.now.strftime("start %H:%M:%S") ,"reject start ", current_number) 
			# |20140312 edit start| * 破壊的メソッドだと数が多い場合すごく遅くなるため変更
			# @terms.reject! {|x| x % current_number == 0 && x != current_number}
			ary = @terms.reject {|x| x % current_number == 0 && x != current_number}
			@terms = ary
			# |20140312 edit end|
			# |debug| print(Time.now.strftime("start %H:%M:%S") ,"reject end ", current_number) 
			i += 1
			current_number = @terms[i]
		end
		
		return @terms
	end
	
	# 三角数生成
	def create_triangle_number
		@terms = Array.new
		
		i = 0
		current_number = 1
		while current_number <= @max_number do
			@terms.push current_number
			i += 1
			current_number = @terms[i - 1] + i + 1
		end
		
		return @terms
	end
	
	# コラッツ数列生成 ＊無限ループする可能性あり(コラッツ問題)
	def create_collatz
		@terms = Array.new
		
		current_number = @start_number
		# 1 になるまで繰り返し。
		until false do
			@terms.push current_number
			if current_number == 1 then
				break
			elsif current_number.odd? then
				current_number = (current_number * 3) + 1
			else
				current_number /= 2
			end
		end
		
		return @terms
	end
end
