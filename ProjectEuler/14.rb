#! ruby -Ku
p Time.now.strftime("%H:%M:%S start")
require ("../module/MathTool")
include MathTool

MAX_NUMBER = 1_000_000
#MAX_NUMBER = 14

collatz_hsh = Hash.new

# 1 については処理しておく。
collatz_hsh[1] = 1

# MAX_NUMBER未満、かつ 1を除く
(MAX_NUMBER - 2).times do |i|
	num = i + 2
	#print(Time.now.strftime("%H:%M:%S "), collatz_hsh.length,"\n")
	# 作成済みコラッツ数列の中にあるかどうか
	if collatz_hsh.key?(num) then
		next
	else
		num_now = num
		key_ary = Array.new
		key_ary[0] = num_now
		while true do
			# コラッツ数列の次の数を取得
			num_next = MathTool::get_collatz_next_number(num_now)
			# 作成済みコラッツ数列の中にあるかどうか
			collatz_hsh_value = collatz_hsh[num_next]
			if collatz_hsh_value != nil then
				#ary_c = Marshal.load(Marshal.dump(ary)) # 2次元配列のコピー(2次元目も複製する。)
				key_ary_length = key_ary.length
				key_ary.each do |x|
					#print("insert =", x.first,"ary =",x + ary,"\n")
					if x < MAX_NUMBER then
						collatz_hsh[x] = key_ary_length + collatz_hsh_value
					end
					key_ary_length -= 1
				end
				break
			# 存在しない場合
			else
				key_ary.push num_next
				
				num_now = num_next
				next
			end
		end
	end
end

# 値が最大のデータ
p collatz_hsh.max {|x, y| x[1] <=> y[1] }

p Time.now.strftime("%H:%M:%S end")
